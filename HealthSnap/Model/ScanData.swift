//
//  ScanData.swift
//  HealthSnap
//
//  Created by Michael Varian Kostaman on 22/05/24.
//

import Foundation

struct ScanData : Identifiable {
    var id = UUID()
    let content: String
    
    init(content:String){
        self.content = content
    }
}
