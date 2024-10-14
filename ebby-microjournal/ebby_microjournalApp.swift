//
//  ebby_microjournalApp.swift
//  ebby-microjournal
//
//  Created by Luca Bockmann on 08.10.24.
//

import SwiftUI
import SwiftData

@main
struct ebby_microjournalApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Notes.self,
            Eintrag.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
