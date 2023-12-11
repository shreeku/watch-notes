//
//  CreditView.swift
//  watch-notes Watch App
//
//  Created by Shree kumaar Rathinavelu sivasankaran on 12/10/23.
//

import SwiftUI

struct CreditView: View {
    var body: some View {
        VStack(spacing: 3) {
            // PROFILE IMAGE
            Image("Shreeku-1")
                .resizable()
                .scaledToFit()
            // HEADER
            HeaderView(title: "Credits")
            // CONTENT
            Text("Shree Rathinavelu")
                .foregroundColor(.primary)
                .fontWeight(.bold)
            
            Text("Developer")
                .foregroundColor(.secondary)
                .font(.footnote)
                .fontWeight(.regular)
        } //: VSTACK
    }
}

struct CreditView_Previews: PreviewProvider {
    static var previews: some View {
        CreditView()
    }
}
