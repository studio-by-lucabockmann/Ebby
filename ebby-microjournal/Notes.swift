//
//  Notes.swift
//  ebby-microjournal
//
//  Created by Luca Bockmann on 08.10.24.
//

import Foundation
import SwiftData

@Model
final class Notes {
    @Attribute(.unique) var title: String
    var lastUpdate: String
    @Relationship var eintraege: [Eintrag]
    var createdAt: Date
    
    init(title: String, lastUpdate: String) {
        self.title = title
        self.lastUpdate = lastUpdate
        self.eintraege = []
        self.createdAt = Date()
    }
}
