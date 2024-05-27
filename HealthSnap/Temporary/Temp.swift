//import SwiftUI
//
//struct RecordView: View {
//    @ObservedObject private var dataManager = BloodTestDataManager.shared
//    
//    let dateFormatter: DateFormatter = {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "dd/MM" // Custom format for date/month
//        return formatter
//    }()
//    
//    var body: some View {
//        NavigationStack {
//            VStack(alignment: .leading) {
//                // Column headers
//                HStack {
//                    Text("Date").bold().frame(width: 80, alignment: .leading)
//                    Text("Name").bold().frame(minWidth: 325, maxWidth: .infinity, alignment: .leading)
//                    Text("Status").bold().frame(maxWidth: .infinity, alignment: .leading)
//                    Text("Action").bold().frame(maxWidth: .infinity, alignment: .leading)
//                }
//                .padding(.horizontal)
//                
//                Divider()
//                
//                // Data rows
//                ScrollView {
//                    LazyVStack(alignment: .leading, spacing: 10) {
//                        ForEach(dataManager.bloodTestDataArray) { data in
//                            HStack {
//                                Text("\(data.date, formatter: dateFormatter)")
//                                    .foregroundColor(Color.accentColor)
//                                    .font(.system(size: 20, weight: .semibold))
//                                    .frame(width: 80, alignment: .leading)
//                                Text("\(data.name)")
//                                    .frame(minWidth: 325, maxWidth: .infinity, alignment: .leading)
//                                Text("\(data.result)")
//                                    .frame(maxWidth: .infinity, alignment: .leading)
//                                Text("See Details")
//                                    .frame(maxWidth: .infinity, alignment: .leading)
//                            }
//                            .padding(.horizontal)
//                        }
//                    }
//                    .padding(.vertical)
//                    
//                }
//            }
//            .padding()
//        }
//    }
//}
//
//struct RecordView_Previews: PreviewProvider {
//    static var previews: some View {
//        RecordView()
//    }
//}
