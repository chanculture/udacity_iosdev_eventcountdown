//
//  EventsView.swift
//  Event Countdown
//
//  Created by Christopher Chan on 6/26/24.
//

import SwiftUI

struct EventsView: View {
    @State private var events = EventsController.shared.events.sorted()
    @State private var editingEvent = Event()
    
    var body: some View {
        
        NavigationStack {
            List($events) { $event in
                NavigationLink(destination: EventForm(event: $event,
                                                      events: $events,
                                                      mode: .edit(event),
                                                      onSave: onSave)) {
                    EventRow(event: event)
                }
                .swipeActions {
                    Button(role: .destructive, action: {
                        events.remove(at: events.firstIndex(of: event)!)
                    }) {
                        Label("Delete", systemImage: "trash")
                    }
                    .tint(.red)
                }
            }
            .navigationTitle("Events")
            .toolbar {
                // Additions
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination:EventForm( event:$editingEvent,
                                                          events: $events,
                                                          mode:.add,
                                                          onSave: onSave)) {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
    
    private func onSave(updatedEvent: Event) {
        if let i = events.firstIndex(of: updatedEvent) {
            events[i].title = updatedEvent.title
            events[i].date = updatedEvent.date
            events[i].textColor = updatedEvent.textColor
        }
    }

}

#Preview {
    EventsView()
//    EventsView(events: .constant(EventsController.shared.events))
}
