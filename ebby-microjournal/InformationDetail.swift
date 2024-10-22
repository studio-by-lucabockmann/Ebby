//
//  InformationDetail.swift
//  Ebby
//
//  Created by Luca Bockmann on 14.10.24.
//

import SwiftUI

struct InformationDetail: View {
    var body: some View {
        NavigationStack {
            List {
                Section {
                    Text("Grundlegendes")
                        .bold()
                        .font(.system(size: 18))
                        .padding([.top], 16)
                    
                    Text("Hier findest du alle nützlichen Informationen und Links, die dir helfen können, falls du Fragen hast.")
                        .padding([.bottom], 20)
                        .font(.system(size: 14))
                        
                }
                .listRowSeparator(.hidden)
                
                
                Section {
                    HStack {
                        Text("Version")
                        Spacer()
                        Text("0.5.0 - Beta")
                            .opacity(0.6)
                    }
                    
                    NavigationStack {
                        NavigationLink("Mir gehts nicht so gut!") {
                            SeelsorgeView()
                        }
                    }
                }
                
                
                Section {
                    HStack {
                        Text("Website")
                        Spacer()
                        Link("https://studiobylucabockmann.de", destination: URL(string: "https://studiobylucabockmann.de")!)
                            .tint(Color("secondary"))
                            .opacity(0.6)
                            
                    }
                    HStack {
                        Text("Mail")
                        Spacer()
                        Link("hey@studiobylucabockmann.de", destination: URL(string: "mailto:hey@studiobylucabockmann.de")!)
                            .tint(Color("secondary"))
                            .opacity(0.6)
                    }
                }
                header: {
                    Text("Contact")
                }
                footer: {
                    Text("© 2024 studio.by.lucabockmann")
                }
            }
        }
        .scrollContentBackground(.hidden)
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Informationen")
        .background(Color("light-gray"))
        
    }
}




struct SeelsorgeView: View {
    var body: some View {
        NavigationStack {
            List {
                Section {
                    HStack {
                        Text("Seelsorge Hotline")
                        Spacer()
                        Link("116 123", destination: URL(string: "tel:116123")!)
                            .tint(.black)
                            .opacity(0.6)
                            
                    }
                    
                    HStack {
                        Text("Deutsche Depressionshilfe")
                        Spacer()
                        Link("0800 / 33 44 533", destination: URL(string: "tel:08003344533")!)
                            .tint(.black)
                            .opacity(0.6)
                            
                    }
                }
            }  
        }
        .scrollContentBackground(.hidden)
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Du willst Reden?")
        .background(Color("light-gray"))
    }
}
