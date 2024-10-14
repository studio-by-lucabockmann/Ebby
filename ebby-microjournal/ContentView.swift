//
//  ContentView.swift
//  ebby-microjournal
//
//  Created by Luca Bockmann on 08.10.24
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Notes.createdAt, order: .reverse) private var notes: [Notes]
    @State var isSheetOpen = false
    @State var isNoteOpen = false
    @State private var usePrimaryBackground = false
    
    var body: some View {
        NavigationStack {
            List {
                if notes.isEmpty {
                    Text("Dein Journal ist noch leer. Klicke einfach auf das “+” um zu starten")
                        .listRowSeparator(.hidden)
                        .padding([.top], 12)
                }

                ForEach(notes) { note in
                    NoteList(note: note)
                }
                .onDelete(perform: deleteItems)
                .cornerRadius(10)
            }
            .listStyle(.plain)
            .navigationTitle("Alle Einträge")
            .navigationBarTitleDisplayMode(.large)
        }
        .tint(Color("primary"))
        .listRowInsets(EdgeInsets())
        .scrollContentBackground(.hidden)
        .padding(0)

        
        /*  ---- Notiz erstllen ----
            Hier
            ----------------------
         */
        VStack {
            Button(action: {
                self.isSheetOpen.toggle()
                createNote()
            }, label: {
                Image("icon-plus")
                    .frame(width: 25, height: 25)
                    .padding(12)
                    .background(Color("primary"))
                    .cornerRadius(50)
            })
            .sheet(isPresented: $isSheetOpen) { CreateNoteView(note: notes.last!) }
            
            
        }
        .frame(maxWidth: .infinity, alignment: .trailing)
        .padding([.leading, .trailing], 20)
        .background(.white)
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(notes[index])
            }
        }
    }
    
    private func createNote() {
        
        let note = Notes(title: Date().formatted(date: .long, time: .omitted), lastUpdate: Date().formatted(date: .omitted, time: .shortened))
        let timmedLastTitle = notes.last?.title.trimmingCharacters(in: .whitespacesAndNewlines) ?? "leer"
        let timmedNewTitle = note.title.trimmingCharacters(in: .whitespacesAndNewlines)
        

        if (timmedLastTitle != timmedNewTitle) {
            modelContext.insert(note)
            
            try? modelContext.save()
        }
    }
}
