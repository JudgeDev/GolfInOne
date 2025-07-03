//
//  SettingsView.swift
//  GolfInOne
//
//  Created by William Chandler on 03.07.25.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("refreshInterval") var refreshInterval: Double = 1.0
    @ObservedObject var bleManager: BLEManager

    var body: some View {
        Form {
            Section(header: Text("Bluetooth Sensor")) {
                // Bluetooth status
                HStack {
                    Text("Status")
                    Spacer()
                    Text(bleManager.isSwitchedOn ? "On" : "Off")
                        .foregroundColor(bleManager.isSwitchedOn ? .green : .red)
                }
                // Scan button
                Button("Scan for Devices") {
                    bleManager.startScanning()
                }
                // Device list (named only)
                let namedPeripherals = bleManager.discoveredPeripherals.filter { ($0.name ?? "").isEmpty == false }
                if !namedPeripherals.isEmpty {
                    ForEach(namedPeripherals, id: \.identifier) { peripheral in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(peripheral.name ?? "Unknown")
                                    .fontWeight(.medium)
                                if peripheral.identifier != bleManager.connectedPeripheral?.identifier {
                                    Button("Connect") {
                                        bleManager.connect(to: peripheral)
                                    }
                                    .font(.caption)
                                } else {
                                    Text("Connected")
                                        .font(.caption)
                                        .foregroundColor(.green)
                                }
                            }
                            Spacer()
                        }
                    }
                } else {
                    Text("No named devices found")
                        .foregroundColor(.gray)
                }

                // Connected peripheral
                if let connected = bleManager.connectedPeripheral {
                    HStack {
                        Text("Connected to")
                        Spacer()
                        Text(connected.name ?? "Unknown")
                            .foregroundColor(.green)
                    }
                }
            }

            Section(header: Text("Data Update Interval")) {
                HStack {
                    Text("Interval")
                    Spacer()
                    Text(String(format: "%.1f s", refreshInterval))
                }
                Slider(value: $refreshInterval, in: 0.1...2.0, step: 0.1)
            }
        }
        .navigationTitle("Settings")
    }
}

#Preview {
    SettingsView(
        bleManager: BLEManager()  // Use a new instance
    )
}
