////
////  ResultView.swift
////  HealthSnap
////
////  Created by Michael Varian Kostaman on 21/05/24.
////
//
//import SwiftUI
//import CoreML
//
//struct ResultView: View {
//    @State private var date = Date.now
//    @State private var lymp = 3.0
//    @State private var netup = 4.0
//    @State private var rbc = 5.0
//    @State private var hgb = 6.0
//    @State private var mcv = 20.0
//    @State private var mch = 58.0
//    @State private var mchc = 70.0
//    @State private var plt = 21
//    
//    @State private var alertTitle = ""
//    @State private var alertMessage = ""
//    @State private var showingAlert = false
//    
//    var body: some View {
//        Text("Hello, World!")
////        Button("Analyze", action: heatlhyClassifier)
////        Text(alertMessage)
//    }
//    
//    func heatlhyClassifier() {
//        do {
//            let config = MLModelConfiguration()
//            let model = try HealthyClassifier(configuration: config)
//            
//            let prediction = try model.prediction(LYMp: lymp, NEUTp: netup, RBC: rbc, HGB: hgb, MCV: mcv, MCH: mch, MCHC: mchc, PLT: Int64(plt))
//            
//            alertTitle = "Your health condition is"
//            alertMessage = prediction.Diagnosis
//        } catch {
//            alertTitle = "Error"
//            alertMessage = "Sorry, there was a problem classifying your health conditions."
//        }
//        
//        showingAlert = true
//    }
//}
//
//#Preview {
//    ResultView()
//}
