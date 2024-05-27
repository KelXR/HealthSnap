// Import SwiftUI
import SwiftUI

struct RecordView: View {
    @ObservedObject private var dataManager = BloodTestDataManager.shared

    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd / MM"
        return formatter
    }()

    var body: some View {
        
        VStack {
            
            HeaderView(title: "Medical Record Analysis")
                        
            NavigationStack {
                
                Spacer()
                
                HStack {
                    Text("Analysis of All Past Medical Checkup Results")
                        .font(.system(size: 24, weight: .semibold))
                    
                    Spacer()
                    
                    Button (action: {
                        
                    }) {
                        Text("Filter By   ▼")
                            .font(.headline)
                            .padding(.vertical, 9)
                            .padding(.horizontal, 12)
                            .background(Color.accentColor)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
                .padding([.leading, .trailing], 16)
                
                VStack(alignment: .leading) {
                    // Column headers
                    HStack {
                        Text("Date").bold().frame(width: 80, alignment: .leading)
                        Text("Name").bold().frame(minWidth: 325, maxWidth: .infinity, alignment: .leading)
                        Text("Status").bold().frame(maxWidth: .infinity, alignment: .leading)
                        Text("Action").bold().frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding(.horizontal)

                    Divider()

                    // Data rows
                    ScrollView {
                        LazyVStack(alignment: .leading, spacing: 10) {
                            ForEach(dataManager.bloodTestDataArray) { data in
                                HStack {
                                    Text("\(data.date, formatter: dateFormatter)")
                                        .foregroundColor(Color.accentColor)
                                        .font(.system(size: 20, weight: .semibold))
                                        .frame(width: 80, alignment: .leading)
                                    VStack (alignment: .leading){
                                        Text("\(data.name)")
                                        
                                        Text("\(data.abnormal) Abnormal, \(data.normal) Normal, \(data.belowNormal) Below Normal")
                                            .opacity(0.5)
                                            .font(.system(size: 14, weight: .medium))
                                    }.frame(minWidth: 325, maxWidth: .infinity, alignment: .leading)
                                        
                                    Group {
                                        Text("\(data.result)")
                                            .padding(.horizontal, 40)
                                            .padding(.vertical, 12)
                                            .background(self.resultColor(for: data.result))
                                            .foregroundColor(.white)
                                            .cornerRadius(10)
                                            .font(.system(size: 12, weight: .semibold))
                                    }.frame(maxWidth: .infinity, alignment: .leading)
                                    
                                    NavigationLink(destination: RecordDetail(data: data)) {
                                        Text("See Details >")
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                    }
                                }
                                .padding(.horizontal)
                                .padding(.top, 30)
                                .padding(.bottom, 30)
                                
                                Divider()
                            }
                        }
                    }
                }
                .padding(.top, 40)
                .padding(.bottom, 40)
            }
            .padding(.top, 32)
            .padding([.leading, .trailing], 16)
        }.ignoresSafeArea(edges: .top)
    }
    
    private func resultColor(for result: String) -> Color {
        switch result {
        case "Unhealthy":
            return Color.yellow
        case "Very Unhealthy":
            return Color.red
        case "Healthy":
            return Color.green
        default:
            return Color.gray
        }
    }
}

struct RecordView_Previews: PreviewProvider {
    static var previews: some View {
        RecordView()
    }
}
