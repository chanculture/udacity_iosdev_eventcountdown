//
//  EventCellView.swift
//  Event Countdown
//
//  Created by Christopher Chan on 6/27/24.
//

import SwiftUI

struct EventRow: View {
    @State private var currentDate = Date.now
    let event: Event
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var timeRemaining: String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        return formatter.localizedString(for: event.date, relativeTo: currentDate)
    }
    
    var body: some View {
        
        VStack (content: {
            VStack {
                HStack{
                    Text(event.title)
                        .foregroundColor(event.textColor)
                        .frame(alignment: .leading)
                    // OPTION: What is the line limit
                        .lineLimit(1)
                    Spacer()
                }
                HStack{
                    Text(timeRemaining)
                        .frame(alignment: .leading)
                        .onReceive(timer) { input in
                            currentDate = input
                        }
                    Spacer()
                }
            }

        })
        
    }
}

#Preview {
    EventRow(event: EventsController.shared.events[0])
}

