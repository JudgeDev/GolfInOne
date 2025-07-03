//
//  SensorDataStore.swift
//  GolfInOne
//
//  Created by William Chandler on 03.07.25.
//
// File to store the sensor data using the Combine framework
//
// In any view (like PuttingBlockListView) that wants access to the latest sensor frame
// without coupling to the BLEManager, just do:
// @StateObject private var sensorData = SensorDataStore.shared
//
// Or, for read-only child views:
// @ObservedObject var sensorData = SensorDataStore.shared
//
//
import Foundation
import Combine

class SensorDataStore: ObservableObject {
    static let shared = SensorDataStore()
    
    @Published var latestFrame: SensorFrame? = nil

    private init() {} // Singleton
    
    func update(with frame: SensorFrame) {
        DispatchQueue.main.async {
            self.latestFrame = frame
        }
    }
}
