//
//  ebby_add_noteLiveActivity.swift
//  ebby-add-note
//
//  Created by Luca Bockmann on 15.10.24.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct ebby_add_noteAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct ebby_add_noteLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: ebby_add_noteAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension ebby_add_noteAttributes {
    fileprivate static var preview: ebby_add_noteAttributes {
        ebby_add_noteAttributes(name: "World")
    }
}

extension ebby_add_noteAttributes.ContentState {
    fileprivate static var smiley: ebby_add_noteAttributes.ContentState {
        ebby_add_noteAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: ebby_add_noteAttributes.ContentState {
         ebby_add_noteAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: ebby_add_noteAttributes.preview) {
   ebby_add_noteLiveActivity()
} contentStates: {
    ebby_add_noteAttributes.ContentState.smiley
    ebby_add_noteAttributes.ContentState.starEyes
}
