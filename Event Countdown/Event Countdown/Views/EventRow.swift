//
//  EventCellView.swift
//  Event Countdown
//
//  Created by Christopher Chan on 6/27/24.
//

import SwiftUI

struct EventRow: View {
    // TODO: Add timer to update tiem remaining
    let event: Event
    var body: some View {
        
        VStack (content: {
            VStack {
                HStack{
                    Text(event.title)
                        .foregroundColor(event.textColor)
                        .frame(alignment: .leading)
                    // TODO: What is the line limit
                        .lineLimit(1)
                    Spacer()
                }
                HStack{
                    Text(event.timeRemaining)
                        .frame(alignment: .leading)
                    Spacer()
                }
            }
            //Spacer()
        })
        
    }
}

#Preview {
    
    EventRow(event: EventsController.shared.events[0])
    
//    EventRow(event: Event(title: "A long description for an event that we need to remember",
//                               date: Date.distantFuture,
//    
//textColor: .red))
    
}
    
