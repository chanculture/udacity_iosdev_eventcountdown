//
//  EventsView.swift
//  Event Countdown
//
//  Created by Christopher Chan on 6/26/24.
//

import SwiftUI

struct EventsView: View {
//    @Binding var events: [Event]
    @State private var events = EventsController.shared.events
    @State private var editingEvent = Event()
    
    var body: some View {
        
        NavigationStack {
            List($events) { $event in
                NavigationLink(destination: EventForm(event: $event, events: $events, mode: .edit(event))) {
                    EventRow(event: event)

                }
            }
            .navigationTitle("Events")
            .toolbar {
                // Additions
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination:EventForm( event:$editingEvent, events: $events, mode:.add)) {
                        Image(systemName: "plus")
                    }
                }

            }
            .onAppear(perform: {
              
            })

        }
        
    }
    
    
//                List ($events) { $event in
//                    NavigationLink(destination: EventForm(event: $event, mode: .edit(event))) {
//                        EventRow(event: event)
//                    }
//                }
//
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
//        EventsView(events: .constant(EventsController.shared.events))
        EventsView()
    }
}

//#Preview {
//    EventsView(events: .constant(EventsController.shared.events))
//}
