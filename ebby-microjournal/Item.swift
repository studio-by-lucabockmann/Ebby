//
//  Item.swift
//  ebby-microjournal
//
//  Created by Luca Bockmann on 08.10.24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
