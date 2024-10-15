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
            ZStack {
                Color("light-gray").edgesIgnoringSafeArea(.all)
                
                List {
                    ForEach(note.eintraege) { eintrag in
                        VStack {

                            Text(eintrag.time)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .font(.system(size: 16))
                                .bold()
                                .padding([.bottom], 2)
                            Text(eintrag.text)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .font(.system(size: 16))
                                .padding([.bottom], 8)
                        }
                    }
                    .listRowBackground(Color("light-gray"))
                    .listRowSeparator(.hidden)
                    .padding([.top], 20)
                }
            }
        }
        .listStyle(.plain)
        .navigationTitle(note.title)
        .navigationBarTitleDisplayMode(.large)
    }
}
