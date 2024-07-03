//
//  Event.swift
//  Event Countdown
//
//  Created by Christopher Chan on 6/26/24.
//

import Foundation
import SwiftUI

// TODO: Add conforms to Hashable or Codable?
struct Event: Comparable, Hashable, Identifiable {
    var id: UUID
    var title: String
    var date: Date
    var textColor:Color
    var timeRemaining: String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        return formatter.localizedString(for: date, relativeTo: Date.now)
        //return printCurrentTimeDifference(date)
    }
    
    init() {
        self.id = UUID()
        self.title = String()
        self.date = Date.now
        self.textColor = Color.blue
    }
    
    init(id: UUID = UUID(), title: String, date: Date, textColor: Color) {
        self.id = id
        self.title = title
        self.date = date
        self.textColor = textColor
    }
    
    
    // Ensure these are sufficient to allow for Sets
    static func < (lhs: Event, rhs: Event) -> Bool {
        return lhs.date < rhs.date
    }
    
    static func > (lhs: Event, rhs: Event) -> Bool {
        return lhs.date > rhs.date
    }
    
    static func == (lhs: Event, rhs: Event) -> Bool {
        return lhs.id == rhs.id ? true : false
    }
    
//    static func === (lhs: Event, rhs: Event) -> Bool {
//        return lhs.id == rhs.id ? true : false
//    }
}

extension Event {
    static var emptyEvent: Event {
        Event(title: "", date: Date.now, textColor: .blue)
    }
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

//extension Color: Codable {
//    enum CodingKeys: String, CodingKey {
//        case red, green, blue
//    }
//    
//    public init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        let r = try container.decode(Double.self, forKey: .red)
//        let g = try container.decode(Double.self, forKey: .green)
//        let b = try container.decode(Double.self, forKey: .blue)
//        
//        self.init(red: r, green: g, blue: b)
//    }
//
//    public func encode(to encoder: Encoder) throws {
//        guard let colorComponents = self.colorComponents else {
//            return
//        }
//        
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        
//        try container.encode(colorComponents.red, forKey: .red)
//        try container.encode(colorComponents.green, forKey: .green)
//        try container.encode(colorComponents.blue, forKey: .blue)
//    }
//}

