//import SwiftUI
//
//struct RecordView: View {
//    
//    @ObservedObject private var dataManager = BloodTestDataManager.shared
//    
//    var body: some View {
//        VStack {
//            HeaderView(title: "Medical Record Analysis")
//            
//            
//            
//            NavigationStack {
//                VStack {
//                    if dataManager.bloodTestDataArray.isEmpty {
//                        Text("No data available")
//                            .font(.title)
//                    } else {
//                        List(dataManager.bloodTestDataArray) { data in
//                            VStack(alignment: .leading) {
//                                Text("Date: \(data.date, formatter: dateFormatter)")
//                                Text("Lymphocyte Percentage: \(data.lymp)")
//                                Text("Neutrophils: \(data.neut)")
//                                Text("RBC: \(data.rbc)")
//                                Text("Hemoglobin: \(data.hgb)")
//                                Text("MCV: \(data.mcv)")
//                                Text("MCH: \(data.mch)")
//                                Text("MCHC: \(data.mchc)")
//                                Text("Platelet Count: \(data.plt)")
//                                Text("Result: \(data.result)")
//                            }
//                        }
//                        .padding(.top, 54)
//                    }
//                }
//                .toolbar {
//                    ToolbarItem(placement: .navigationBarLeading) {
//                        Text("Analysis of All Past Medical Checkup Results")
//                            .padding(.leading, 28)
//                            .padding(.top, 54)
//                            .font(.system(size: 24, weight: .semibold))
//                    }
//                    ToolbarItem(placement: .navigationBarTrailing) {
//                        HStack {
//                            Button(action: {
//                                printTesting()
//                            }) {
//                                Text("Filter By   ▼")
//                                    .font(.headline)
//                                    .padding(.vertical, 9)
//                                    .padding(.horizontal, 12)
//                                    .background(Color.accentColor)
//                                    .foregroundColor(.white)
//                                    .cornerRadius(10)
//                            }
//                            
//                            
//                        }
//                        .padding(.top, 54)
//                        .padding(.trailing, 28)
//                    }
//                    
//                }
//            }
//        }
//        .ignoresSafeArea(edges: .top)
//    }
//    
//    private func printTesting() {
//        if !dataManager.bloodTestDataArray.isEmpty {
//            print(dataManager.bloodTestDataArray[0].lymp)
//        } else {
//            print("No data available")
//        }
//    }
//    
//    private var dateFormatter: DateFormatter {
//        let formatter = DateFormatter()
//        formatter.dateStyle = .short
//        return formatter
//    }
//}
//
//#Preview {
//    RecordView()
//}
