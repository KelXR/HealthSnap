//
//  BloodTestDataManager.swift
//  HealthSnap
//
//  Created by Michael Varian Kostaman on 25/05/24.
//

import Foundation

class BloodTestDataManager: ObservableObject {
    static let shared = BloodTestDataManager()
    
    private init() { }
    
    @Published var bloodTestDataArray: [BloodTestData] = []
    @Published var filteredDataArray: [BloodTestData] = []
    
    func filterHealthy() {
        filteredDataArray = bloodTestDataArray.filter { $0.result == "Healthy" }
    }
    
    func filterUnhealthy() {
        filteredDataArray = bloodTestDataArray.filter { $0.result == "Unhealthy" }
    }
    
    func filterVeryUnhealthy() {
        filteredDataArray = bloodTestDataArray.filter { $0.result == "Very Unhealthy" }
    }
}


