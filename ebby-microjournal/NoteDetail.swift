//
//  NoteDetail.swift
//  Ebby
//
//  Created by Luca Bockmann on 14.10.24.
//

import SwiftUI

struct NoteDetail: View {
    @Bindable var note: Notes
    
    var body: some View {
        
        NavigationStack {
            List {
                ForEach(note.eintraege) { eintrag in
                    VStack {
                        
                        Text(eintrag.time)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(Font.custom("HankenGrotesk-Bold", size: 16))
                            .padding([.bottom], 2)
                        Text(eintrag.text)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(Font.custom("HankenGrotesk-Medium", size: 16))
                            .padding([.bottom], 8)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .listRowSeparator(.hidden)
                .padding([.top], 20)
            }
            .listRowInsets(EdgeInsets())
        }
        .listStyle(.plain)
        .navigationTitle(note.title)
        .navigationBarTitleDisplayMode(.large)
        .scrollContentBackground(.hidden)
        
    }
}
