//
//  RecordDetail.swift
//  HealthSnap
//
//  Created by Michael Varian Kostaman on 27/05/24.
//

import SwiftUI

struct RecordDetail: View {
    let data: BloodTestData
    @State private var selectedCategory: String = "Abnormal"
    
    var body: some View {
        ScrollView {
            VStack {
                VStack {
                    Text("This result shows")
                        .font(.system(size: 20, weight: .semibold))
                    .opacity(0.5)
                    
                    Text("\(data.result)")
                        .font(.system(size: 70, weight: .bold))
                        .foregroundColor(Color.accentColor)
                }
                
                Image("LabReportImage")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 692)
                    .padding(.bottom, 51)
                
                // Display detailed information about the data
                HStack {
                    Button(action: {
                        selectedCategory = "Abnormal"
                    }) {
                        Text("Abnormal")
                            .padding([.top, .bottom], 25)
                            .padding([.leading, .trailing], 48)
                            .frame(maxWidth: .infinity)
                            .background(selectedCategory == "Abnormal" ? Color.accentColor : Color.white)
                            .foregroundColor(selectedCategory == "Abnormal" ? Color.white : Color.black)
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.blue, lineWidth: 2)
                            )
                            .font(.system(size: 16, weight: .bold))
                            .opacity(selectedCategory == "Abnormal" ? 1.0 : 0.5)
                    }

                    Button(action: {
                        selectedCategory = "Normal"
                    }) {
                        Text("Normal")
                            .padding([.top, .bottom], 25)
                            .padding([.leading, .trailing], 48)
                            .frame(maxWidth: .infinity)
                            .background(selectedCategory == "Normal" ? Color.accentColor : Color.white)
                            .foregroundColor(selectedCategory == "Normal" ? Color.white : Color.black)
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.blue, lineWidth: 2)
                            )
                            .font(.system(size: 16, weight: .bold))
                            .opacity(selectedCategory == "Normal" ? 1.0 : 0.5)
                    }

                    Button(action: {
                        selectedCategory = "Below Normal"
                    }) {
                        Text("Below Normal")
                            .padding([.top, .bottom], 25)
                            .padding([.leading, .trailing], 48)
                            .frame(maxWidth: .infinity)
                            .background(selectedCategory == "Below Normal" ? Color.accentColor : Color.white)
                            .foregroundColor(selectedCategory == "Below Normal" ? Color.white : Color.black)
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.blue, lineWidth: 2)
                            )
                            .font(.system(size: 16, weight: .bold))
                            .opacity(selectedCategory == "Below Normal" ? 1.0 : 0.5)
                    }
                }
                .padding([.leading, .trailing], 65)
                .padding(.bottom, 41)
                
                // Component 1
                VStack {
                    HStack {
                        Text("Neutrophils: \(String(format: "%.1f", data.neut)) %")
                            .font(.system(size: 30, weight: .bold))
                        
                        Spacer()
                        
                        ZStack(alignment: .topLeading) {
                            Rectangle()
                                .fill(Color.maroon)
                                .cornerRadius(10)
                                .padding([.leading, .trailing], 10)
                                .padding([.top, .bottom], 18)
                            
                            Text("+\(String(format: "%.1f", data.neut - 70.0))% than average")
                                .foregroundColor(.white)
                                .padding(.top, 22) // Adjust the top padding to position the text within the rectangle
                                .padding(.leading, 18) // Adjust the leading padding to position the text within the rectangle
                        }
                        .frame(minWidth: 100, minHeight: 64) // Set a minimum size for the ZStack
                        .padding(.trailing, 120)
                    }.padding(.leading, 16)
                        .padding(.top, 28)
                    
                    HStack {
                        HStack (alignment: .top){
                            Text("Description:")
                                .bold()
                            
                            Text("Neutrophils merupakan jenis sel darah putih yang berperan penting dalam melawan infeksi bakteri.")
                        }
                        
                        Spacer()
                    }.padding(.bottom, 9)
                        .padding(.leading, 16)
                    
                    
                    HStack {
                        HStack (alignment: .top){
                            Text("Explanation:")
                                .bold()
                            
                            Text("Normal range for neutrophils is 55-70%. Neutrophils at 73.1% indicate an increase, which can be termed as neutrophilia and can be caused by various conditions, including infections, inflammation, physical or emotional stress, and some other medical conditions.")
                        }
                        
                        Spacer()
                    }.padding(.bottom, 9)
                        .padding(.leading, 16)
                    
                    HStack {
                        HStack (alignment: .top){
                            Text("Suggestion:")
                                .bold()
                            
                            Text("Consult with the responsible doctor to obtain the correct interpretation of these lab results and understand the cause of this increase in neutrophils.")
                        }
                        
                        Spacer()
                    }.padding(.bottom, 28)
                        .padding(.leading, 16)
                }
                .background(Color.white)
                .cornerRadius(18)
                .padding([.leading, .trailing], 65)
                .shadow(color: Color.black.opacity(0.2), radius: 8.1, x: 0, y: 3)
                .padding(.bottom, 31)
                
                // Component 2
                VStack {
                    HStack {
                        Text("Total RBC: \(String(format: "%.1f", data.rbc)) μL")
                            .font(.system(size: 30, weight: .bold))
                        
                        Spacer()
                        
                        ZStack(alignment: .topLeading) {
                            Rectangle()
                                .fill(Color.maroon)
                                .cornerRadius(10)
                                .padding([.leading, .trailing], 10)
                                .padding([.top, .bottom], 18)
                            
                            Text("+\(String(format: "%.1f", 4.7 - data.rbc)) x 10^6 μL  below average")
                                .foregroundColor(.white)
                                .padding(.top, 22) // Adjust the top padding to position the text within the rectangle
                                .padding(.leading, 18) // Adjust the leading padding to position the text within the rectangle
                        }
                        .frame(minWidth: 160, minHeight: 64) // Set a minimum size for the ZStack
                        .padding(.trailing, 120)
                    }.padding(.leading, 16)
                        .padding(.top, 28)
                    
                    HStack {
                        HStack (alignment: .top){
                            Text("Description:")
                                .bold()
                            
                            Text("Total RBC (Red Blood Cell) count refers to the number of red blood cells present in a microliter (μL) of blood.")
                        }
                        
                        Spacer()
                    }.padding(.bottom, 9)
                        .padding(.leading, 16)
                    
                    
                    HStack {
                        HStack (alignment: .top){
                            Text("Explanation:")
                                .bold()
                            
                            Text("The normal range for total RBC (Red Blood Cell) count typically falls between 4.2 to 6.1 million cells per microliter (million/μL). Total RBC at 4.13 indicate a deficiency of red blood cells or hemoglobin in the blood. It can result from various factors, including nutritional deficiencies (such as iron, vitamin B12, or folate deficiency), chronic diseases, blood loss, or bone marrow problems.")
                        }
                        
                        Spacer()
                    }.padding(.bottom, 9)
                        .padding(.leading, 16)
                    
                    HStack {
                        HStack (alignment: .top){
                            Text("Suggestion:")
                                .bold()
                            
                            Text("Dietary changes or supplements to address these deficiencies. Eating a diet rich in iron, vitamin B12, and folate (found in foods like leafy greens, meat, fish, eggs, and fortified cereals) can help improve red blood cell production.")
                        }
                        
                        Spacer()
                    }.padding(.bottom, 28)
                        .padding(.leading, 16)
                }
                .background(Color.white)
                .cornerRadius(18)
                .padding([.leading, .trailing], 65)
                .shadow(color: Color.black.opacity(0.2), radius: 8.1, x: 0, y: 3)
                .padding(.bottom, 31)
                
                Spacer()
            }
            .padding()
        }
    }
}

// Preview for RecordDetail
struct RecordDetail_Previews: PreviewProvider {
    static var previews: some View {
        let bloodTestData = BloodTestData(name: "Test Name",
                                          date: Date(),
                                          lymp: 0.0,
                                          neut: 0.0,
                                          rbc: 0.0,
                                          hgb: 0.0,
                                          mcv: 0.0,
                                          mch: 0.0,
                                          mchc: 0.0,
                                          plt: 0,
                                          result: "Healthy",
                                          abnormal: 0,
                                          normal: 0,
                                          belowNormal: 0)

        return RecordDetail(data: bloodTestData)
    }
}

