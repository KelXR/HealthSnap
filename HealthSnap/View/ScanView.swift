import SwiftUI
import CoreML

struct ScanView: View {
    
    @State private var showScannerSheet = false
    @State private var texts: [ScanData] = []
    @State private var words: [String] = []
    @State private var bloodTestDataArray: [BloodTestData] = []
    
    var body: some View {
        
        VStack {
            HeaderView(title: "Medical Scan")
            
            NavigationStack {
                VStack {
                    if texts.count > 0 {
                        List {
                            ForEach(texts) { text in
                                NavigationLink(
                                    destination: ScrollView {
                                        Text(text.content)
                                    },
                                    label: {
                                        Text(text.content).lineLimit(1)
                                        Text(words[0])
                                    }
                                )
                            }
                        }
                    } else {
                        Text("No scan yet").font(.title)
                    }
                }
                .navigationBarItems(trailing: Button(action: { self.showScannerSheet = true }, label: {
                    Image(systemName: "doc.text.viewfinder")
                        .font(.title)
                })
                    .sheet(isPresented: $showScannerSheet, content: {
                        makeScannerView()
                    })
                )
                .onAppear {
                    self.showScannerSheet = true
                }
            }
        }.ignoresSafeArea(edges: .top)
    }
    
    private func assigningData(){
        var index = 0
        var lymp = 0
        var neut = 0
        var rbc = 0
        var hgb = 0
        var mcv = 0
        var mch = 0
        var mchc = 0
        var plt = 0
        
        var valName = "Medical Checkup Analysis - Result #"
        var valLymp: Double = 0
        var valNeut: Double = 0
        var valRbc: Double = 0
        var valHgb: Double = 0
        var valMcv: Double = 0
        var valMch: Double = 0
        var valMchc: Double = 0
        var valPlt: Double = 0
        var result: String = ""
        
        var afterTestName = 0
        
        var resultNumber = BloodTestDataManager.shared.bloodTestDataArray.count + 1
        
        valName += "\(resultNumber)"
        
        print(valName)
        
        for word in words {
            
            if (word == "TEST NAME"){
                index = 0
            } else if (word == "VALUE"){
                afterTestName = 1
                index = 0
            } else {
                index = index + 1
            }
            if (word == "LYMPHOCYTE PERCENTAGE"){
                lymp = index
            } else if (word == "NEUTROPHILS"){
                neut = index
            } else if (word == "TOTAL RBC"){
                rbc = index
            } else if (word == "HEMOGLOBIN"){
                hgb = index
            } else if (word.contains("MCV")){
                mcv = index
            } else if (word.contains("MCH")){
                mch = index
            } else if (word.contains("MCHC")){
                mchc = index
            } else if (word.contains("PLATELET COUNT")){
                plt = index
            }

            if (index == lymp && afterTestName == 1) {
                if let value = Double(word) {
                    valLymp = value
                }
            } else if (index == neut && afterTestName == 1){
                if let value = Double(word) {
                    valNeut = value
                }
            } else if (index == rbc && afterTestName == 1){
                if let value = Double(word) {
                    valRbc = value
                }
            } else if (index == hgb && afterTestName == 1){
                if let value = Double(word) {
                    valHgb = value
                }
            } else if (index == mcv && afterTestName == 1){
                if let value = Double(word) {
                    valMcv = value
                }
            } else if (index == mch && afterTestName == 1){
                if let value = Double(word) {
                    valMch = value
                }
            } else if (index == mch && afterTestName == 1){
                if let value = Double(word) {
                    valMchc = value
                }
            } else if (index == plt && afterTestName == 1){
                if let value = Double(word) {
                    valPlt = value
                }
            }
        }
        
        var valAbnormal = 0
        var valNormal = 0
        var valBelowNormal = 0
        
        // Lymp
        if (valLymp >= 20.0 && valLymp <= 40.0){
            valNormal += 1
        } else if (valLymp < 20){
            valBelowNormal += 1
        } else {
            valAbnormal += 1
        }
        
        // Neut
        if (valNeut >= 55.0 && valNeut <= 70.0){
            valNormal += 1
        } else if (valNeut < 55){
            valBelowNormal += 1
        } else {
            valAbnormal += 1
        }
        
        // Rbc
        if (valRbc >= 4.7 && valRbc <= 6.1){
            valNormal += 1
        } else if (valRbc < 4.7){
            valBelowNormal += 1
        } else {
            valAbnormal += 1
        }
        
        // Hgb
        if (valHgb >= 14.0 && valHgb <= 18.0){
            valNormal += 1
        } else if (valHgb < 14.0){
            valBelowNormal += 1
        } else {
            valAbnormal += 1
        }
        
        // Mcv
        if (valMcv >= 80.0 && valMcv <= 100.0){
            valNormal += 1
        } else if (valMcv < 80.0){
            valBelowNormal += 1
        } else {
            valAbnormal += 1
        }
        
        // Mch
        if (valMch >= 27.0 && valMch <= 31.0){
            valNormal += 1
        } else if (valMch < 27.0){
            valBelowNormal += 1
        } else {
            valAbnormal += 1
        }
        
        // Mchc
        if (valMchc >= 32.0 && valMchc <= 36.0){
            valNormal += 1
        } else if (valMchc < 32.0){
            valBelowNormal += 1
        } else {
            valAbnormal += 1
        }
        
        // plt
        if (valPlt >= 150 && valPlt <= 450){
            valNormal += 1
        } else if (valPlt < 150){
            valBelowNormal += 1
        } else {
            valAbnormal += 1
        }
        
        result = analyzeHeatlhCondition(lymp: valLymp, netup: valNeut, rbc: valRbc, hgb: valHgb, mcv: valMcv, mch: valMch, mchc: valMchc, plt: Int64(valPlt))
        
        let newBloodTestData = BloodTestData(
            name: valName,
            date: Date(),
            lymp: valLymp,
            neut: valNeut,
            rbc: valRbc,
            hgb: valHgb,
            mcv: valMcv,
            mch: valMch,
            mchc: valMchc,
            plt: Int64(valPlt),
            result: result,
            abnormal: valAbnormal, 
            normal: valNormal,
            belowNormal: valBelowNormal
        )
        BloodTestDataManager.shared.bloodTestDataArray.append(newBloodTestData)
    }
    
    private func analyzeHeatlhCondition(lymp: Double, netup: Double, rbc: Double, hgb: Double, mcv: Double, mch: Double, mchc: Double, plt: Int64) -> String {
        do {
            let config = MLModelConfiguration()
            let model = try HealthyClassifier(configuration: config)
            
            let prediction = try model.prediction(LYMp: lymp, NEUTp: netup, RBC: rbc, HGB: hgb, MCV: mcv, MCH: mch, MCHC: mchc, PLT: Int64(plt))
            
            return prediction.Diagnosis
        } catch {
            return "Error"
        }
    }
    
    
    private func processScannedText(_ text: String) {
        let lines = text.components(separatedBy: "\n")
        words = lines
        
        // Assigning BloodTestData
        assigningData()
    }
    
    private func makeScannerView() -> ScannerView {
        ScannerView(completion: { textPerPage in
            if let outputText = textPerPage?.joined(separator: "\n").trimmingCharacters(in: .whitespacesAndNewlines) {
                let newScanData = ScanData(content: outputText)
                self.texts.append(newScanData)
                processScannedText(outputText)
            }
            self.showScannerSheet = false
        })
    }
}

#Preview {
    ScanView()
}
