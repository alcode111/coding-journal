//
//  DetailedEntryView.swift
//  CodingJournal
//
//  Created by Ismail Larbi Pacha on 10/12/24.
//

import SwiftUI
import SwiftData

struct DetailedEntryView: View {
    @Environment(\.dismiss) var dismiss
    @Bindable var entry: Entry
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    HStack {
                        Text(entry.formattedDateTime)
                            .accessibilityLabel("Entry date: \(entry.formattedDateTime)")
                    }
                    
                    Spacer()
                    
                    HStack(spacing: 20) {
                        Button {
                            
                        } label: {
                            ZStack {
                                Circle()
                                    .fill(.mainBackground)
                                    .frame(width: 20, height: 20)
                                
                                Circle()
                                    .stroke(Color(.label), lineWidth: 2)
                                    .frame(width: 20, height: 20)
                                
                                Image(systemName: "ellipsis")
                                    .foregroundStyle(Color(.label))
                                    .font(.system(size: 14, weight: .bold))
                            }
                        }
                        .accessibilityLabel("More options")
                        
                        Button {
                            dismiss()
                        } label: {
                            Text("Done")
                                .foregroundStyle(Color(.label))
                                .bold()
                        }
                        .accessibilityLabel("Close entry")
                        .accessibilityHint("Double tap to save changes and return")
                    }
                }
                
                TextField("Title", text: $entry.title)
                    .font(.title.bold())
                    .accessibilityLabel("Entry title")
                    .accessibilityHint("Enter the title for your journal entry")
                
                TextField("Subtitle", text: $entry.subtitle)
                    .font(.title2.bold())
                    .accessibilityLabel("Entry subtitle")
                    .accessibilityHint("Enter a subtitle for your journal entry")
                
                TextField("Details", text: $entry.details, axis: .vertical)
                    .multilineTextAlignment(.leading)
                    .accessibilityLabel("Entry details")
                    .accessibilityHint("Enter the main content of your journal entry")
            }
            .padding()
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
        return DetailedEntryView(entry: entry)
            .modelContainer(container)
    } catch {
        fatalError("Could not load the container.")
    }
}
