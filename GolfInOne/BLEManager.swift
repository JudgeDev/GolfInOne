//
//  BLEManager.swift
//  GolfInOne
//
//  Created by William Chandler on 03.07.25.
//
//  Responsible for managing Bluetooth Low Energy (BLE) connections to the WT9011 sensor.
//  - Scans and connects to BLE peripherals
//  - Subscribes to FFE4 notifications and parses 20-byte sensor frames
//  - Converts raw bytes to scaled accelerometer, gyro, and angle data
//  - Emits `SensorFrame` structs with timestamped motion data
//
//  Note: Acts as the sensor data gateway — no analysis logic is included here.
//  Used via `@EnvironmentObject` in UI views like `PutterAnalysisView`.
//


import Foundation
import CoreBluetooth

// frame of sensor data produced by bluetooth manager
// define here for the moment - will be modified when Combine pattern for publishing sensor data is implemented
struct SensorFrame {
    let timestamp: Date
    let acceleration: (x: Double, y: Double, z: Double)
    let gyro: (x: Double, y: Double, z: Double)
    let angle: (roll: Double, pitch: Double, yaw: Double)
}

class BLEManager: NSObject, ObservableObject, CBCentralManagerDelegate, CBPeripheralDelegate {
    var myCentral: CBCentralManager!
    @Published var isSwitchedOn = false
    @Published var discoveredPeripherals: [CBPeripheral] = []
    @Published var connectedPeripheral: CBPeripheral?
    var discoveredCharacteristics: [CBUUID: CBCharacteristic] = [:]
    //@Published var latestSensorFrame: SensorFrame?  // frame of sensor data that can be used by other files
    
    override init() {
        super.init()
        myCentral = CBCentralManager(delegate: self, queue: nil)
    }

    // MARK: - Central Manager Delegate
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        isSwitchedOn = central.state == .poweredOn
        print("Bluetooth state: \(central.state.rawValue)")
    }

    func startScanning() {
        print("Start scanning...")
        myCentral.scanForPeripherals(withServices: nil, options: nil)
    }

    func stopScanning() {
        print("Stop scanning...")
        myCentral.stopScan()
    }

    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String: Any], rssi RSSI: NSNumber) {
        if !discoveredPeripherals.contains(where: { $0.identifier == peripheral.identifier }) {
            DispatchQueue.main.async {
                self.discoveredPeripherals.append(peripheral)
            }
        }
        //print("Discovered: \(peripheral.name ?? "Unknown") - \(peripheral.identifier)")
    }

    func connect(to peripheral: CBPeripheral) {
        print("Connecting to \(peripheral.name ?? "Unknown")...")
        peripheral.delegate = self  // <- IMPORTANT: Set BEFORE connecting
        connectedPeripheral = peripheral
        myCentral.connect(peripheral, options: nil)
    }

    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        print("Connected to \(peripheral.name ?? "Unknown")")
        peripheral.discoverServices(nil)
    }

    // MARK: - Peripheral Delegate
    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        for service in peripheral.services ?? [] {
            print("Discovered service: \(service.uuid)")
            peripheral.discoverCharacteristics(nil, for: service)
        }
    }

    func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
        for characteristic in service.characteristics ?? [] {
            print("Discovered characteristic: \(characteristic.uuid) with properties \(characteristic.properties)")
            discoveredCharacteristics[characteristic.uuid] = characteristic

            if characteristic.uuid.uuidString.contains("FFE4") {
                if characteristic.properties.contains(.notify) {
                    print("FFE4 supports notify, enabling...")
                    peripheral.setNotifyValue(true, for: characteristic)
                } else {
                    print("FFE4 does NOT support notify — fallback may be needed.")
                }
            }
        }
    }

    func peripheral(_ peripheral: CBPeripheral, didUpdateNotificationStateFor characteristic: CBCharacteristic, error: Error?) {
        if let error = error {
            print("Failed to update notification state for \(characteristic.uuid): \(error.localizedDescription)")
            return
        }
        print("Notification state updated for \(characteristic.uuid): \(characteristic.isNotifying)")
    }

    func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor characteristic: CBCharacteristic, error: Error?) {
        

        guard let data = characteristic.value else { return }
        //print("Received \(data.count) bytes: \(data.map { String(format: "%02X", $0) }.joined(separator: " "))")

        guard data.count >= 20 else {
            print("Received short packet")
            return
        }
        guard data[0] == 0x55 && data[1] == 0x61 else {
            print("Unexpected header: \(data[0]), type: \(data[1])")
            return
        }
        
        func toInt16LE(_ low: UInt8, _ high: UInt8) -> Int16 {
            return Int16(bitPattern: UInt16(low) | (UInt16(high) << 8))
        }


        let ax = toInt16LE(data[2], data[3])
        let ay = toInt16LE(data[4], data[5])
        let az = toInt16LE(data[6], data[7])
        let gx = toInt16LE(data[8], data[9])
        let gy = toInt16LE(data[10], data[11])
        let gz = toInt16LE(data[12], data[13])
        let roll = toInt16LE(data[14], data[15])
        let pitch = toInt16LE(data[16], data[17])
        let yaw = toInt16LE(data[18], data[19])

        let aScale = 16.0 / 32768.0
        let gScale = 2000.0 / 32768.0
        let angleScale = 180.0 / 32768.0
        
        let frame = SensorFrame(
            timestamp: Date(),
            acceleration: (
                x: Double(ax) * aScale,
                y: Double(ay) * aScale,
                z: Double(az) * aScale
            ),
            gyro: (
                x: Double(gx) * gScale,
                y: Double(gy) * gScale,
                z: Double(gz) * gScale
            ),
            angle: (
                roll: Double(roll) * angleScale,
                pitch: Double(pitch) * angleScale,
                yaw: Double(yaw) * angleScale
            )
        )
        // update data frame in publisher
        SensorDataStore.shared.update(with: frame)

        //DispatchQueue.main.async {
        //    self.latestSensorFrame = frame
        //}

        /*
        print("""
            ✅ Combined Frame:
              Accel   → x: \(Double(ax)*aScale)g, y: \(Double(ay)*aScale)g, z: \(Double(az)*aScale)g
              Gyro    → x: \(Double(gx)*gScale)°/s, y: \(Double(gy)*gScale)°/s, z: \(Double(gz)*gScale)°/s
              Angle   → roll: \(Double(roll)*angleScale)°, pitch: \(Double(pitch)*angleScale)°, yaw: \(Double(yaw)*angleScale)°
            """)
         */
    }
    
}
