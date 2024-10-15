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
                        .padding([.top], 16)
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                    Text("Hier findest du alle möglichen nützlichen Informationen und Links die dir helfen können solltest du Fragen haben.")
                        .padding([.bottom], 20)
                        .font(.system(size: 14))
                        .multilineTextAlignment(.center)
                        
                }
                .listRowSeparator(.hidden)
                
                Section {
                    HStack {
                        Text("Version:")
                        Spacer()
                        Text("0.5 - Beta")
                            .opacity(0.6)
                    }
                }
                
                
                Section {
                    HStack {
                        Text("Website:")
                        Spacer()
                        Link("https://studiobylucabockmann.de", destination: URL(string: "https://studiobylucabockmann.de")!)
                            .opacity(0.6)
                    }
                    HStack {
                        Text("Mail:")
                        Spacer()
                        Link("hey@studiobylucabockmann.de", destination: URL(string: "mailto:hey@studiobylucabockmann.de")!)
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
