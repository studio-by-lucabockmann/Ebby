//
//  NoteList.swift
//  Ebby
//
//  Created by Luca Bockmann on 14.10.24.
//

import SwiftUI


/*  ---- Notizenliste ----
    Liste aller erstellten Notizen
    von hier aus kommt man auch
    in die Notiz Detailseite.
    ----------------------
 */
struct NoteListing: View {
    @Bindable var note: Notes
    
    var body: some View {
        Section {
            VStack {
                Text(note.title)
                    .font(.system(size: 16))
                    .bold()
                    .foregroundStyle(Color("secondary"))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading, .trailing],16)
                Text("letztes Update: \(note.lastUpdate)")
                    .font(.system(size: 16))
                    .padding([.top], 2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundStyle(Color("secondary"))
                    .padding([.leading, .trailing],16)
            }
        }
        .background(displayBackgroundColour(note: note.title))
        .padding([.top, .bottom], 16)
        .overlay {
            NavigationLink(destination: {
                NoteDetail(note: note)
            },
            
            label: {
                EmptyView()
            })
            .opacity(0)
        }
        .listRowSeparator(.hidden)
        .background(displayBackgroundColour(note: note.title))
    }
}


/*  ---- Hintergrundfarbe ----
    Nur die aktuelle Notiz wird in der
    primary-color angezeigt. Alle anderen
    werden in einer grauen farbe hinterlegt!
    ----------------------
 */
func displayBackgroundColour(note: String) -> Color {
    return note == String(Date().formatted(date: .long, time: .omitted)) ? Color("primary") : Color(.systemGray5)
}
