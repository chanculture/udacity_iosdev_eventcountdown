//
//  EventsView.swift
//  Event Countdown
//
//  Created by Christopher Chan on 6/26/24.
//

import SwiftUI

struct EventsView: View {
    @State private var events = EventsController.shared.events
//    @State private var events = Event.sampleData
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
            .onAppear(perform: {
//                events = EventsController.shared.events
            })

        }
        
    }
    
    private func onSave(updatedEvent: Event) {
        if let i = events.firstIndex(of: updatedEvent) {
            events[i].title = updatedEvent.title
            events[i].date = updatedEvent.date
            events[i].textColor = updatedEvent.textColor
        }
//        for i in 0..<self.events.count {
//            if self.events[i].id == updatedEvent.id {
//                self.events[i].title = updatedEvent.title
//                self.events[i].date = updatedEvent.date
//                self.events[i].textColor = updatedEvent.textColor
//            }
//        }
    }

//     STYLE 1
//     Edits
//                List ($events) { $event in
//                    NavigationLink(destination: EventForm(event: $event, mode: .edit(event))) {
//                        EventRow(event: event)
//                    }
//                }
//                
//     STYLE 2
//                    ForEach( $events, id:\.self) { $event in
//                        NavigationLink( destination: EventForm(event: $event)) {
//                            //editingEvent = $event
//                            EventRow(event: event)
//                        }
//                    }
//                .onDelete(perform: { indexSet in
//                    delete(at: indexSet)
//                })
    
//    func delete(at offsets: IndexSet) {
//        //        eventsController.events.remove(atOffsets: offsets)
//        events.remove(atOffsets: offsets)
//    }
}


struct EventsView_Previews: PreviewProvider {
    static var previews: some View {
        EventsView()
    }
}
//#Preview {
//    EventsView(events: .constant(EventsController.shared.events))
//}




//    @State private var events:[Event] = [
//        Event(title: "My 40th Birthday",
//              year: "2024",
//              month: "09",
//              day: "25",
//              textColor: .red),
//        Event(title: "Important work meeting",
//              year: "2020",
//              month: "08",
//              day: "06",
//              textColor: .blue),
//        Event(title: "Pick up Groceries",{
//              year: "2024",
//              month: "08",
//              day: "17",
//              textColor: Color(.sRGB, red: 0.78, green: 0.75, blue: 0.68)),
//    ]
