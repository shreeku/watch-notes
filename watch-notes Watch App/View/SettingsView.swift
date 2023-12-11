//
//  SettingsView.swift
//  watch-notes Watch App
//
//  Created by Shree kumaar Rathinavelu sivasankaran on 12/10/23.
//

import SwiftUI

struct SettingsView: View {
    
    @AppStorage("notesLineCount") var notesLineCount: Int = 1
    @State private var value: Float = 1.0
    
    func updateLineCount() {
        notesLineCount = Int(value)
    }
    
    
    var body: some View {
        VStack(spacing: 8) {
            // HEADER
            HeaderView(title: "Settings")
            // LINES COUNT
            Text("Lines:\(notesLineCount)".uppercased())
                .fontWeight(.bold)
            // SLIDER
            Slider(value: Binding(get: {self.value} , set: {(newValue) in self.value = newValue
                self.updateLineCount()}), in:1...4, step:1)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
