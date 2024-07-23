//
//  Event.swift
//  Event Countdown
//
//  Created by Christopher Chan on 6/26/24.
//

import Foundation
import SwiftUI

//class Event: Comparable, Identifiable {
// Previously designed the Data Model as a struct
struct Event: Comparable, Identifiable, Hashable {
    
    let id: UUID
    var title: String
    var date: Date
    var textColor:Color
    var timeRemaining: String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        return formatter.localizedString(for: date, relativeTo: Date.now)
    }
    
    init() {
        self.id = UUID()
        self.title = String()
        self.date = Date.now
        self.textColor = Color.blue
    }
    
    init(title: String, date: Date, textColor: Color) {
        self.id = UUID()
        self.title = title
        self.date = date
        self.textColor = textColor
    }
    
    init(id: UUID, title: String, date: Date, textColor: Color) {
        self.id = id
        self.title = title
        self.date = date
        self.textColor = textColor
    }
    
    
    init(id: UUID = UUID(), title: String, year: String, month: String, day: String, textColor: Color) {
        let fmt = ISO8601DateFormatter()
        self.id = id
        self.title = title
        self.date = fmt.date(from: "\(year)-\(month)-\(day)T00:00:00+8000")!
        self.textColor = textColor
    }
    
    //TODO: Ensure these are sufficient to allow for Sets
    static func < (lhs: Event, rhs: Event) -> Bool {
        return lhs.date < rhs.date
    }
    
    static func > (lhs: Event, rhs: Event) -> Bool {
        return lhs.date > rhs.date
    }
    
    static func == (lhs: Event, rhs: Event) -> Bool {
        return lhs.id == rhs.id
    }
    
}

extension Event {
    static var emptyEvent: Event {
        Event(title: "", date: Date.now, textColor: .blue)
    }
}

extension Event {
    static let sampleData: [Event] =
    [
        Event(title: "My 40th Birthday",
              year: "2025",
              month: "09",
              day: "25",
              textColor: .red),
        Event(title: "Important work meeting",
              year: "2020",
              month: "08",
              day: "06",
              textColor: .blue),
        Event(title: "Pick up Groceries",
              year: "2024",
              month: "05",
              day: "27",
              textColor: .green),
        Event(title: "Schedule delivery of goods, and then make up some really long desciption to see how it is formatted in the View.  Also might want to allow the vie to show multiline lines.",
              year: "2025",
              month: "10",
              day: "18",
              textColor: Color(.sRGB, red: 0.78, green: 0.75, blue: 0.68)),
    ]
}

extension Event {
    
    func generateSampleData () -> [Event] {
        
        let fmt = ISO8601DateFormatter()
        
        let date1 = fmt.date(from: "2024-09-25T00:00:00+8000")!
        let date2 = fmt.date(from: "2020-08-06T07:37:46+8000")!
        let date3 = fmt.date(from: "2024-08-06T21:45:46+8000")!
        let date4 = fmt.date(from: "2025-10-06T09:30:15+8000")!
        
        let sampleData: [Event] =
        [
            Event(title: "My 40th Birthday",
                  date: date1,
                  textColor: .red),
            Event(title: "Important work meeting",
                  date: date2,
                  textColor: .blue),
            Event(title: "Pick up Groceries",
                  date: date3,
                  textColor: .green),
            Event(title: "Schedule delivery of goods, and then make up some really long desciption to see how it is formatted in the View.  Also might want to allow the vie to show multiline lines.",
              date: date4,
              textColor: Color(.sRGB, red: 0.78, green: 0.75, blue: 0.68)),
        ]
        
        return sampleData
    
    }
}
