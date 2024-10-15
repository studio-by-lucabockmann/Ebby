//
//  Eintrag.swift
//  ebby-microjournal
//
//  Created by Luca Bockmann on 08.10.24.
//

import Foundation
import SwiftData

@Model
final class Eintrag {
    var time: String
    var text: String
    
    init(time: String, text: String) {
        self.time = time
        self.text = text
    }
}
