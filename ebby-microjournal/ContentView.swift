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
            ZStack {
                Color("light-gray").edgesIgnoringSafeArea(.all)
                
                List {
                    if notes.isEmpty {
                        Text("Dein Journal ist noch leer. Klicke einfach auf das “+” um zu starten")
                            .listRowSeparator(.hidden)
                            .listRowBackground(Color("light-gray"))
                            .padding([.top], 12)
                            .opacity(0.4)
                            
                    }

                    ForEach(notes) { note in
                        NoteList(note: note)
                    }
                    .onDelete(perform: deleteItems)
                    .cornerRadius(10)
                    .padding([.top], 20)
                    .listRowBackground(Color("light-gray"))
                }
                .listStyle(.plain)
                .navigationTitle("Alle Einträge")
                .toolbar {
                    ToolbarItem(content: {
                        NavigationLink(destination: {
                            InformationDetail()
                        },
                        
                        label: {
                            Image("icon-info")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30, alignment: .trailing)
                        })
                    })
                }
                .navigationBarTitleDisplayMode(.large)
                .background(Color("light-gray"))
            }
        }
        .listRowInsets(EdgeInsets())
        .tint(Color("primary"))
            
        
        /*  ---- Notiz erstllen ----
            Hier
            ----------------------
         */
        VStack(spacing: 0) {
            Button(action: {
                self.isSheetOpen.toggle()
                createNote()
            }, label: {
                Image("icon-plus")
                    .resizable()
                    .frame(width: 35, height: 35)
                    .padding(16)
                    .background(Color("primary"))
                    .cornerRadius(50)
            })
            .sheet(isPresented: $isSheetOpen) { CreateNoteView(note: notes.last!) }
        }
        .frame(maxWidth: .infinity, alignment: .trailing)
        .padding([.leading, .trailing], 20)
        .background(Color("light-gray"))
        .padding(.top, -10)
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
