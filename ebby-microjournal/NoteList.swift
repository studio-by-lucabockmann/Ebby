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
struct NoteList: View {
    @Bindable var note: Notes
    
    var body: some View {
        VStack {
            Text(note.title)
                .font(Font.custom("HankenGrotesk-Bold", fixedSize: 20))
                .foregroundStyle(.black)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding([.leading, .trailing],16)
            Text("letztes Update: \(note.lastUpdate)")
                .font(Font.custom("HankenGrotesk-Medium", fixedSize: 16))
                .padding([.top], 2)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundStyle(.black)
                .padding([.leading, .trailing],16)
        }
        .background(displayBackgroundColour(note: note.title))
        .padding([.top], 16)
        .padding([.bottom], 36)
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
    return note == String(Date().formatted(date: .long, time: .omitted)) ? Color("primary") : Color("light-gray")
}
