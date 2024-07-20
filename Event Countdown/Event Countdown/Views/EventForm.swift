//
//  EventView.swift
//  Event Countdown
//
//  Created by Christopher Chan on 6/27/24.
//

import SwiftUI

enum Mode {
    case add
    case edit(Event)
}

struct EventForm: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Binding var event: Event
    @Binding var events: [Event]
    @State var mode:Mode
    @State private var viewTitle = ""
    @State private var eventTitle = ""
    @State private var eventDate = Date.now
    @State private var eventTextColor = Color.red
    let onSave: (Event) -> Void
    
    var body: some View {

            
        Form {
//            Section(header: Text(viewTitle)) {
            Section {
                // TODO: UI is not responding to user interaction.
                TextField("Title", text: $eventTitle)
                    .multilineTextAlignment(.leading)
                    .lineLimit(1)
                    .padding(.horizontal)
                    .foregroundColor(eventTextColor)

                DatePicker("Date", selection: $eventDate)
                    .padding(.horizontal)
                
                ColorPicker("Text Color", selection: $eventTextColor, supportsOpacity: false)
                    .padding(.horizontal)
            }
        }
        .navigationBarTitle(viewTitle, displayMode: .inline)
//        .navigationTitle(viewTitle).font(.caption)
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button(action: {
                    switch (mode) {
                    case .add:
                        events.append(Event(title: eventTitle,
                                            date: eventDate,
                                            textColor: eventTextColor)
                        )
                    case .edit:
//                        print("placeholder")
                        event.title = eventTitle
                        event.date = eventDate
                        event.textColor = eventTextColor
                        onSave(event)
                        
                    }
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "checkmark")
                }
                .disabled(eventTitle.isEmpty)
            }
        }
        .onAppear {
            switch (mode) {
            case .add:
                viewTitle = "Add Event"
            case .edit(let event):
                viewTitle = "Edit \(event.title)"
                eventTitle = event.title
                eventDate = event.date
                eventTextColor = event.textColor
            
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
        EventForm(event: .constant(EventsController.shared.events[0]),
                  events: .constant(EventsController.shared.events),
                  mode: .add,
                  onSave: {_ in }
                  //mode:.edit(EventsController.shared.events[0])
        )
        
    }
}

