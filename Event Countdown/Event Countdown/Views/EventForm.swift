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
    @Environment(\.presentationMode) var dismiss
    @Binding var events: [Event]
    @State var mode:Mode
    @State private var viewTitle = ""
    @State private var eventTitle = ""
    @State private var eventDate = Date.now
    @State private var eventTextColor = Color.red
    let onSave: ((Event) -> Void)?
    
    var body: some View {

        Form {
            Section {
                TextField("Title", text: $eventTitle)
                    .multilineTextAlignment(.leading)
                    .lineLimit(1)
                    .foregroundColor(eventTextColor)

                DatePicker("Date", selection: $eventDate)
                
                ColorPicker("Text Color", selection: $eventTextColor, supportsOpacity: false)
            }
        }
        .navigationBarTitle(viewTitle, displayMode: .inline)
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button(action: {
                    switch (mode) {
                    case .add:
                        events.append(Event(title: eventTitle,
                                            date: eventDate,
                                            textColor: eventTextColor)
                        )
                    case .edit(let event):
                        let editEvent = Event(id: event.id, title: eventTitle, date: eventDate, textColor: eventTextColor)
                        guard let onSave = onSave else { return }
                        onSave(editEvent)
                    }
                    self.dismiss.wrappedValue.dismiss()
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
    
    EventForm(events: .constant(EventsController.shared.events),
              mode: .add,
              onSave: nil
    )
}

