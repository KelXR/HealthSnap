////
////  ScanView.swift
////  HealthSnap
////
////  Created by Michael Varian Kostaman on 21/05/24.
////
//
//import SwiftUI
//
//struct ScanView: View {
//    
//    @State private var showScannerSheet = false
//    @State private var texts : [ScanData] = []
//    @State private var words: [String] = []
//    
//    var body: some View {
//        NavigationStack {
//            VStack {
//                if texts.count > 0 {
//                    List {
//                        ForEach (texts) { text in
//                            NavigationLink (
//                                destination: ScrollView {
//                                    Text(text.content)
//
//                                },
//                                label: {
//                                    Text(text.content).lineLimit(1)
//                                }
//                            )
//                        }
//                    }
//                } else {
//                    Text ("No scan yet").font(.title)
//                }
//            }
//            .navigationTitle("Scan OCR")
//            .navigationBarItems(trailing: Button(action: { self.showScannerSheet = true }, label: {
//                Image(systemName: "doc.text.viewfinder")
//                    .font(.title)
//            })
//                .sheet(isPresented: $showScannerSheet, content: {
//                    makeScannerView()
//                })
//            )
//        }
//    }
//    
//    private func processScannedText(_ text: String) {
//            // Split the text into words, trim whitespace, and append to the words array
//            let wordArray = text.split { !$0.isLetter }.map { String($0).trimmingCharacters(in: .whitespacesAndNewlines) }
//            self.words.append(contentsOf: wordArray)
//        }
//    
//    private func makeScannerView()-> ScannerView {
//        ScannerView(completion: {
//            textPerPage in
//            if let outputText = textPerPage?.joined(separator: "\n").trimmingCharacters(in: .whitespacesAndNewlines) {
//                let newScanData = ScanData(content: outputText)
//                self.texts.append(newScanData)
//                processScannedText(outputText)
////                print(newScanData.content)
//            }
//            
//            self.showScannerSheet = false
//        })
//    }
//}
//
//#Preview {
//    ScanView()
//}
