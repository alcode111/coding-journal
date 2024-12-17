//
//  AddNewEntryModal.swift
//  CodingJournal
//
//  Created by Ismail Larbi Pacha on 10/12/24.
//

import SwiftUI
import SwiftData

struct AddNewEntryModal: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    @Bindable var entry: Entry
        
    var body: some View {
        ZStack {
            Color.mainBackground.opacity(0.5).ignoresSafeArea()
            
            ScrollView {
                VStack {
                    HStack {
                        Button {
                            dismiss()
                        } label : {
                            Text("Cancel")
                                .foregroundStyle(.mint.opacity(0.7))
                                .bold()
                        }
                        .accessibilityLabel("Cancel entry")
                        .accessibilityHint("Double tap to discard change and return")
                        
                        Spacer()
                        Spacer()
                        
                        Text("\(Date.now, format: .dateTime.weekday(.abbreviated).month(.abbreviated).day())")
                            .bold()
                            .accessibilityLabel("Current date: \(Date.now, format: .dateTime.weekday(.abbreviated).month(.abbreviated).day())")
                        
                        Spacer()
                        
                        HStack {
                            Button {
                                
                            } label: {
                                ZStack {
                                    Circle()
                                        .fill(.mainBackground)
                                        .frame(width: 25, height: 25)
                                    
                                    Circle()
                                        .stroke(Color(.label), lineWidth: 2)
                                        .frame(width: 25, height: 25)
                                    
                                    Image(systemName: "ellipsis")
                                        .foregroundStyle(Color(.label))
                                        .font(.system(size: 14, weight: .bold))
                                }
                            }
                            .accessibilityLabel("More options")
                            
                            Spacer()
                            
                            Button {
                                modelContext.insert(entry)
                                dismiss()
                            } label: {
                                Text("Done")
                                    .foregroundStyle(Color(.label))
                                    .bold()
                            }
                            .accessibilityLabel("Done")
                            .accessibilityHint("Double tap to save the new entry")
                        }
                        .frame(width: 100)
                        
                    }
                    
                    TextField("Title", text: $entry.title)
                        .font(.title2.bold())
                        .accessibilityLabel("New entry title")
                        .accessibilityHint("Enter the title for your new journal entry")
                    
                    Divider()
                    
                    TextField("Subtitle", text: $entry.subtitle)
                        .font(.body.bold())
                        .accessibilityLabel("New entry subtitle")
                        .accessibilityHint("Enter a subtitle or category for your new entry")
                    
                    Divider()
                    
                    TextField("Start writing here...", text: $entry.details, axis: .vertical)
                        .accessibilityLabel("New entry details")
                        .accessibilityHint("Enter the main content of your new journal entry")
                        
                }
                .padding()
            }
        }
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Entry.self, configurations: config)
        let entry = Entry(
            title: "The 1st rule of Poetry Club",
            subtitle: "GitHub Classroom",
            date: Date.now,
            details: """
Yet another great GitHub Classroom Challenge. Here we are learning about the split method mostly. The tricky thing is that we had to acknowledge for the empty spaces as well as paying attention to the fact that this method returns an array of substrings so we would also have to be mindful of the return type. So much going on but it was definitely great to solve. I had to resort to the chaining of the map method. Using the shorthand syntax we map over each substring and simply convert them to strings using Swift’s String initializer.
""")
        return AddNewEntryModal(entry: entry)
            .modelContainer(container)
    } catch {
        fatalError("Could not load the container.")
    }
}
