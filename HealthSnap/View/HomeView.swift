//
//  HomeView.swift
//  HealthSnap
//
//  Created by Michael Varian Kostaman on 21/05/24.
//

import SwiftUI
import UniformTypeIdentifiers

struct HomeView: View {
    @State private var droppedFileName: String?
    @State private var isDropTargeted = false
    
    var body: some View {
        VStack {
            
            // Header
            HeaderView(title: "Medical Upload")
                        
            Spacer()
            
            // Drag and Drop Section
            RoundedRectangle(cornerRadius: 0)
                .fill(isDropTargeted ? Color.green : Color.white)
                .strokeBorder(style: StrokeStyle(lineWidth: 1, dash: [15]))
                .frame(height: 498)
                
                .overlay(
                    VStack (spacing: 40){
                        
                        // Component 1 -> Icon
                        Image(systemName: "doc.text")
                            .opacity(0.5)
                            .font(.system(size: 88))
                        
                        // Component 2 -> Text
                        VStack (spacing: 10){
                            Text(isDropTargeted ? "Release to drop file here" : "Select Lab Reports To Upload")
                                    .foregroundColor(.black)
                                    .bold()
                                    .font(.system(size: 28))
                                    .opacity(0.5)
                            
                            Text("Upload Your Medical Checkup Results")
                                .foregroundColor(.black)
                                .opacity(0.5)
                                .font(.system(size: 20))
                        }
                        
                        // Component 3 -> Button
                        Button {
                            executeUpload()
                        } label: {
                            Text("Upload")
                                .font(.system(size: 28))
                                .padding([.leading, .trailing], 28)
                                .padding([.top, .bottom], 16)
                                .fontWeight( .medium)
                        }.buttonStyle(.borderedProminent)
                    }
                )
                .padding([.leading, .trailing], 129)
                .onDrop(of: [UTType.fileURL], isTargeted: $isDropTargeted) { providers in
                        handleDrop(providers: providers)
                }
                        
                if let fileName = droppedFileName {
                    Text("Dropped file: \(fileName)")
                        .padding(.top, 20)
                }
            Spacer()
        }
        .ignoresSafeArea(edges: .top)
    }
    
    private func executeUpload(){
        print("Now Uploading")
    }
    
    private func handleDrop(providers: [NSItemProvider]) -> Bool {
            for provider in providers {
                if provider.hasItemConformingToTypeIdentifier(UTType.fileURL.identifier) {
                    provider.loadItem(forTypeIdentifier: UTType.fileURL.identifier, options: nil) { (item, error) in
                        DispatchQueue.main.async {
                            if let url = item as? URL {
                                self.droppedFileName = url.lastPathComponent
                            }
                        }
                    }
                    return true
                }
            }
            return false
        }
}

#Preview {
    HomeView()
}
