//
//  EventsView.swift
//  Event Countdown
//
//  Created by Christopher Chan on 6/26/24.
//

import SwiftUI

struct EventsView: View {
    
    //let event: Event
    @Binding var events: [Event]
    @State var editingEvent = Event.emptyEvent
    @State var newEvent = Event.emptyEvent
    @State private var isEditing = false
    
    func delete(at offsets: IndexSet) {
        //        eventsController.events.remove(atOffsets: offsets)
        events.remove(atOffsets: offsets)
    }
    
    var body: some View {
        
        NavigationStack {
            List {
                ForEach( $events, id:\.self) { $event in
                    NavigationLink( destination: EventForm(event: $event)) {
                        EventRow(event: event)
                    }
                }
                .onDelete(perform: { indexSet in
                    delete(at: indexSet)
                })
            }
            
            // Edits
            List($events) { $event in
                NavigationLink(destination: EventForm(event: $event)) {
                    EventRow(event: event)
                }
            
                
                
//  This does work in this instance
//                .onDelete(perform: { indexSet in
//                    delete(at: indexSet)
//                })
            }
//            .navigationDestination(for: Event.self) { event in
//                EventForm(event: $event)
//            }
            // Additions
            .navigationTitle("Events")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination:EventForm( event:$newEvent)) {
                        Image(systemName: "plus")
                    }
                }

            }

        }

        
//            Text("Events")
//                .foregroundColor(.white)
//                .navigationBarTitle("Events")
//                .toolbar(content: {
//                    ToolbarItem(placement: .topBarTrailing) {
//                        NavigationLink(destination: EventForm(eventViewState: .add, index: -1),
//                                       label: {
//                            Text("+")
//                                .font(.largeTitle)
//                                .padding(.trailing)
//                        })
//                    }
//                })
            
            
            //            // List Sections
            //            List {
            ////                ForEach($eventsController.events, id: \.self) {
            //                ForEach($events, id: \.self) {
            //                    $event in
            //                    NavigationLink(value: event) {
            //                        EventRow(event: event)
            //                    }
            //                }
            //                .onDelete(perform: { indexSet in
            //                    delete(at: indexSet)
            //                })
            //
            //            }
            //            .navigationDestination(for: Event.self) {
            //                event in
            //                    EventForm(eventViewState: .edit, index: \.self )
            //            }
            //
        
    }
}

#Preview {
    
    EventsView(events: .constant(EventsController.shared.events))
    
}
