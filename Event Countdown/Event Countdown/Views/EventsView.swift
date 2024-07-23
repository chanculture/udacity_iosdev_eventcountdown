//
//  EventsView.swift
//  Event Countdown
//
//  Created by Christopher Chan on 6/26/24.
//

import SwiftUI

struct EventsView: View {
    @State private var events = EventsController.shared.events.sorted()
    
    var body: some View {
        
        NavigationStack {
            List($events) { $event in
                NavigationLink(value: event) {
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
            .navigationDestination(for: Event.self, destination: { event in
                EventForm(events: $events,
                          mode: .edit(event),
                          onSave: onSave)
            })
            .navigationTitle("Events")
            .toolbar {
                // Additions
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination:EventForm(events: $events,
                                                        mode:.add,
                                                        onSave: nil)) {
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
