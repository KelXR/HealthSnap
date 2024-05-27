//
//  NavbarView.swift
//  HealthSnap
//
//  Created by Michael Varian Kostaman on 21/05/24.
//

import SwiftUI

enum Tabs: Int {
    case homes = 0
    case scans = 1
    case records = 2
}

struct NavbarView: View {
    
    @Binding var selectedTab: Tabs 
    
    var body: some View {
        
        HStack (alignment: .center) {
            
            // Home
            Button {
                selectedTab = .homes
            } label: {
                VStack (alignment: .center, spacing: 4){
                    
                    Image(systemName: selectedTab == .homes ? "house.fill" : "house")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                    
                    Text("Home")
                        .font(.system(size: 16))
                    
                }.foregroundColor(.white)
            }
            
            Spacer()
            
            // Scan
            Button {
                selectedTab = .scans
            } label: {
                VStack (alignment: .center, spacing: 4){
                    
                    Image(systemName: selectedTab == .scans ? "doc.viewfinder.fill" : "doc.viewfinder")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                    
                    Text("Scan")
                        .font(.system(size: 16))
                    
                }.foregroundColor(.white)
            }
            
            Spacer()
            
            // Records
            Button {
                selectedTab = .records
            } label: {
                VStack (alignment: .center, spacing: 4){
                    
                    Image(systemName: selectedTab == .records ? "doc.text.fill" : "doc.text")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                    
                    Text("Record")
                        .font(.system(size: 16))
                    
                }.foregroundColor(.white)
            }
        }
        .frame(height: 82)
        .padding([.leading, .trailing], 103.17)
        .background(Color.accentColor)

    }
}

struct NavBarView_Previews: PreviewProvider {
    static var previews: some View {
        NavbarView(selectedTab: .constant(.homes))
    }
}
