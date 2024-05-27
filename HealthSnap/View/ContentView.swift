//
//  ContentView.swift
//  HealthSnap
//
//  Created by Michael Varian Kostaman on 21/05/24.
//

import SwiftUI
import UniformTypeIdentifiers

struct ContentView: View {
    
    @State var selectedTab: Tabs = .homes
    
    var body: some View {
        
        VStack {
            Group {
                switch selectedTab {
                    case .homes:
                        HomeView()
                    case .scans:
                        ScanView()
                    case .records:
                        RecordView()
                }
            }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
            
            Spacer()
            
            NavbarView(selectedTab: $selectedTab)
        }
    }
}

#Preview {
    ContentView()
}
