//
//  ContentView.swift
//  watch-notes Watch App
//
//  Created by Shree kumaar Rathinavelu sivasankaran on 12/7/23.
//

import SwiftUI

struct ContentView: View {
//  PROPERTY
  @AppStorage("notesLineCount") var notesLineCount: Int = 1

  @State private var notes: [Note] = [Note]()
  @State private var text: String = ""
//  FUNCTION
  func getDocDir() -> URL {
    let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return path[0]
  }
  
  func saveNote() {
    do {
      let data = try JSONEncoder().encode(notes)
      
      let url = getDocDir().appendingPathComponent("notes")
      
      try data.write(to: url)
    } catch {
      print("Saving data failed !")
    }
  }
  
  func loadNotes() {
    DispatchQueue.main.async {
      do {
        let url = getDocDir().appendingPathComponent("notes")
        
        let data = try Data(contentsOf: url)
        
        notes = try JSONDecoder().decode([Note].self, from: data)
      } catch {
        // pass
      }
    }
  }
  
  func deleteNote(offsets: IndexSet) {
    withAnimation {
      notes.remove(atOffsets: offsets)
      saveNote()
    }
  }
  
  
//  BODY
  var body: some View {
    NavigationView {
      VStack {
        HStack(alignment: .center, spacing: 6) {
          TextField("Add stuff", text: $text)
          
          Button {
            // ACTION
            guard text.isEmpty == false else {return}
            
            let note = Note(id: UUID(), text: text)
            
            notes.append(note)
            
            text = ""
            
            saveNote()
          } label: {
            Image(systemName: "plus.circle")
              .font(.system(size: 25, weight: .semibold))
          }
          .fixedSize()
          .buttonStyle(PlainButtonStyle())
          .foregroundColor(.accentColor)
//          .buttonStyle(BorderedButtonStyle(tint: .accentColor))
        } //: HSTACK
        Spacer()
        
        if notes.count >= 1 {
          List {
            ForEach(0..<notes.count, id:\.self) { idx in
                NavigationLink(destination: DetailView(note: notes[idx], count: notes.count, index: idx)) {
                    HStack {
                    Capsule()
                      .frame(width: 4)
                      .foregroundColor(.accentColor)
                    Text(notes[idx].text)
                      .lineLimit(notesLineCount)
                      .padding(.leading, 5)
                    }
                } //: HSTACK
            } //: LOOP
            .onDelete(perform: deleteNote(offsets:))
          } //: LIST
        } //: IF
        else {
          Spacer()
          Image(systemName: "note.text")
            .resizable()
            .opacity(0.2)
            .scaledToFit()
            .foregroundColor(.gray)
            .padding(15)
          Spacer()
        }
      } //: VSTACK
      .navigationTitle("Notes")
      .onAppear(perform: {
        loadNotes()
      })
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
