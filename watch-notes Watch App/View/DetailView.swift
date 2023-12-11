//
//  DetailView.swift
//  watch-notes Watch App
//
//  Created by Shree kumaar Rathinavelu sivasankaran on 12/10/23.
//

import SwiftUI

struct DetailView: View {
    let note: Note
    let count: Int
    let index: Int
    
    @State private var isCredits: Bool = false
    @State private var isSettings: Bool = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 3) {
            // HEADER
            HeaderView(title: "")
            // CONTENT
            Spacer()
            
            ScrollView(.vertical) {
                Text(note.text)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
            }
            Spacer()
            //FOOTER
            HStack(alignment: .center) {
                Image(systemName: "gear")
                    .imageScale(.large)
                    .onTapGesture {
                        isSettings.toggle()
                    }
                    .sheet(isPresented: $isSettings, content: {
                        SettingsView()
                    })
                Spacer()
                Text("\(index+1) / \(count)")
                Spacer()
                Image(systemName: "info.circle")
                    .imageScale(.large)
                    .onTapGesture {
                        isCredits.toggle()
                    }
                    .sheet(isPresented: $isCredits, content: {
                        CreditView()
                    })
            }
            .foregroundColor(.secondary)
        } //: VSTACK
        .padding(3)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var sampleData: Note = Note(id: UUID(), text: "Sample#1")
    static var previews: some View {
        DetailView(note: sampleData, count: 5, index: 1)
    }
}
