//
//  HeaderView.swift
//  HealthSnap
//
//  Created by Michael Varian Kostaman on 21/05/24.
//

import SwiftUI

struct HeaderView: View {
    
    var title: String
    
    var body: some View {
        Text(title)
            .foregroundColor(.white) // Text color
            .padding(.vertical, 43.5)
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            .background(Color.accentColor)
            .font(.system(size: 28, weight: .bold))
    }
}

#Preview {
    HeaderView(title: "Sample Header")
}
