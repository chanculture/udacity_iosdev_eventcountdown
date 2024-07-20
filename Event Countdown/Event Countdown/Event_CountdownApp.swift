//
//  Event_CountdownApp.swift
//  Event Countdown
//
//  Created by Christopher Chan on 6/26/24.
//

import SwiftUI

@main
struct Event_CountdownApp: App {
//    @State private var events = EventsController.shared.events
//    @State private var events = Event.sampleData
    
    var body: some Scene {
        WindowGroup {
//            EventsView(events: $events)
            EventsView()
        }
    }
}
