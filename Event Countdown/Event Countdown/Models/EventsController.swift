//
//  EventController.swift
//  Event Countdown
//
//  Created by Christopher Chan on 6/27/24.
//

import Foundation
import SwiftUI

class EventsController: ObservableObject {
    
    static let shared = EventsController()
//    @Published var events: [Event]
    var events: [Event]
    
    init() {
        events = [Event]()
        generateTestData()
    }
    
    func load() {
        print(URL.documentsDirectory)
    }
    
    func save() {
        
    }
    
    func addEvent(_ event: Event) -> Void {
        // TODO: do we sort before or after insert
        events.append(event)
    }

    func deleteEvent(at index:Int){
        // TODO: Add Safegaurd
        events.remove(at: index)
    }
    
    func updateEvent(at index:Int, event:Event) {
        events[index] = event
    }
    
    func generateTestData() {
        
        let fmt = ISO8601DateFormatter()

        let date1 = fmt.date(from: "2024-09-25T00:00:00+8000")!
        let date2 = fmt.date(from: "2020-08-06T07:37:46+8000")!
        let date3 = fmt.date(from: "2024-08-06T21:45:46+8000")!
        let date4 = fmt.date(from: "2025-10-06T09:30:15+8000")!
        
        self.events.append(Event(title: "My 40th Birthday",
              date: date1,
              textColor: .red))
        
        events.append(Event(title: "Important work meeting",
              date: date2,
              textColor: .blue))
        events.append(Event(title: "Pick up Groceries",
              date: date3,
              textColor: .green))
        
        events.append(Event(title: "Schedule delivery of goods, and then make up some really long desciption to see how it is formatted in the View.  Also might want to allow the vie to show multiline lines.",
              date: date4,
              textColor: Color(.sRGB, red: 0.78, green: 0.75, blue: 0.68)))
        
    }
    
}

