//
//  ebby_add_noteBundle.swift
//  ebby-add-note
//
//  Created by Luca Bockmann on 15.10.24.
//

import WidgetKit
import SwiftUI

@main
struct ebby_add_noteBundle: WidgetBundle {
    var body: some Widget {
        ebby_add_note()
        ebby_add_noteControl()
        ebby_add_noteLiveActivity()
    }
}
