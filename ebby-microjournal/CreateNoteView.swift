//
//  CreateNoteView.swift
//  Ebby
//
//  Created by Luca Bockmann on 14.10.24.
//

import SwiftUI

struct CreateNoteView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) var dismiss
    
    @Bindable var note: Notes
    @State private var time: String = Date().formatted(date: .omitted, time: .shortened)
    @State private var text: String = ""
    @State private var lastUpdate: String = Date().formatted(date: .omitted, time: .shortened)
    @FocusState private var keyboardFocused: Bool
    
    

    var body: some View {
        NavigationStack {
            Form {
                Text("\(time)  am \(note.title)")
                    .font(Font.custom("HankenGrotesk-Bold", size: 16))
                
                TextField("Wie geht es dir gerade?", text: $text,  axis: .vertical)
                    .focused($keyboardFocused)
                    .padding(0)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            keyboardFocused = true
                        }
                    }
                
                                
                
            }
            .presentationDetents([.medium, .large])
            .presentationDragIndicator(.visible)
            
            VStack {
                Button(action: {
                    let newItem = Eintrag(time: time, text: text)
                    note.eintraege.append(newItem)
                    
                    try? modelContext.save()
                    
                    note.lastUpdate = lastUpdate
                    
                    dismiss()
                }, label: {
                    Image("icon-arrow-up")
                        .frame(width: 25, height: 25)
                        .padding(12)
                        .background(Color("primary"))
                        .cornerRadius(50)
                })
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            .padding([.leading, .trailing], 20)
        }
        .scrollContentBackground(.hidden)
        
        
    }
}

