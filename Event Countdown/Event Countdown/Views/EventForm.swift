//
//  EventView.swift
//  Event Countdown
//
//  Created by Christopher Chan on 6/27/24.
//

import SwiftUI

//enum Mode {
//    case add
//    case edit
//}

struct EventForm: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Binding var event: Event

    @State private var newTitle = ""
    @State private var newDate = Date.now
    @State private var newTextColor = Color.blue
    
    var body: some View {
            
            NavigationStack {
                Form {
                    Section(header: Text("Event Info")) {
     
                        // TODO: UI is not responding to user interaction.
                        TextField("Title", text: $event.title)
                            //.multilineTextAlignment(.leading)
                            //.lineLimit(1)
                            .padding(.horizontal)
                            .foregroundColor(event.textColor)
                        
                        // Text color needs to dynamically change
                        DatePicker("Date", selection: $event.date)
                            .padding(.horizontal)
                        ColorPicker("Text Color", selection: $event.textColor)
                            .padding(.horizontal)
                    }
                }
                .navigationTitle(event.title)
                .toolbar {
                    ToolbarItem(placement: .confirmationAction) {
                        Button(action: {
                            // TODO: Save the Event, Traverse the arrayed and update the correct item
                            //  This is not a good way to handle this, but it is okay for the pusposes of this app.
                            for i in 0..<(EventsController.shared.events.count) {
                                var existingEvent = EventsController.shared.events[i]
                                if existingEvent.id == $event.id {
                                    existingEvent.title = event.title
                                    existingEvent.date = event.date
                                    existingEvent.textColor = event.textColor
                                }
                                
                            }
                            self.presentationMode.wrappedValue.dismiss()
                        }) {
                            Image(systemName: "checkmark")
                        }
                        //.disabled(event.title.isEmpty)
                    }
                }
                
            }
    
        Spacer()    
        
    } // View
}

#Preview {
    
//    EventForm(event: Event(title: "A short description",
//                           date: Date.distantFuture,
//                           textColor: .red)
//              )
    
    // NavigationStack to preview navigation elements on the canvas.
    NavigationStack {
        EventForm(event: .constant(EventsController.shared.events[0])
                  //events: .constant(EventsController.shared.events),
                  //mode:.edit(EventsController.shared.events[0])
        )
        
    }
}
