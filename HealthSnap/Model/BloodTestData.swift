//
//  BloodTestData.swift
//  HealthSnap
//
//  Created by Michael Varian Kostaman on 23/05/24.
//

import Foundation

struct BloodTestData : Identifiable {
    
    var id = UUID()
    var date = Date.now
    var name: String
    
    var lymp: Double
    var neut: Double
    var rbc: Double
    var hgb: Double
    var mcv: Double
    var mch: Double
    var mchc: Double
    var plt: Int64
    var result: String
    
    var abnormal: Int
    var normal: Int
    var belowNormal: Int
    
    init(name: String, date: Date, lymp: Double, neut: Double, rbc: Double, hgb: Double, mcv: Double, mch: Double, mchc: Double, plt: Int64, result: String, abnormal: Int, normal: Int, belowNormal: Int){
        self.name = name
        self.date = date
        self.lymp = lymp
        self.neut = neut
        self.rbc = rbc
        self.hgb = hgb
        self.mcv = mcv
        self.mch = mch
        self.mchc = mchc
        self.plt = plt
        self.result = result
        self.abnormal = abnormal
        self.normal = normal
        self.belowNormal = belowNormal
    }
}
