//
//  CardEntriesView.swift
//  CodingJournal
//
//  Created by Ismaïl on 08/12/2024.
//

import SwiftUI
import SwiftData

struct CardEntriesView: View {
    @State private var isShowingEntryModal = false
    @State private var isSearchActive = false
    @State private var sortOrder = SortDescriptor(\Entry.date, order: .reverse)
    @State private var searchText = ""
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.mainBackground.ignoresSafeArea()
            
            VStack(alignment: .leading) {
                if isSearchActive {
                    searchHeader
                } else {
                    header
                        .padding(.horizontal, 8)
                }
                
                CardEntriesListingView(sort: sortOrder, searchString: searchText)
            }
            .padding(.top, 40)
            .padding(.horizontal)
            
            if !isSearchActive {
                PlusButton(isShowingModal: $isShowingEntryModal)
                    .padding(.top, 8)
                    .frame(maxWidth: .infinity)
                    .background(.ultraThinMaterial)
                    .sheet(isPresented: $isShowingEntryModal) {
                        AddNewEntryModal(entry:
                                            Entry(title: "",
                                                  subtitle: "",
                                                  date: Date.now,
                                                  details: ""))
                    }
                    .accessibilityLabel("Add new journal entry")
                    .accessibilityHint("Double tap to create a new coding journal entry")
            }
        }
    }
}

#Preview {
    CardEntriesView()
}

extension CardEntriesView {
    private var searchHeader: some View {
        HStack {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundStyle(.secondary)
                
                TextField("Search entries...", text: $searchText)
                    .textFieldStyle(.plain)
                    .accessibilityLabel("Search journal entries")
                    .accessibilityHint("Enter text to filter journal entries")
                
                if !searchText.isEmpty {
                    Button {
                        searchText = ""
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundStyle(.secondary)
                    }
                }
            }
            .padding(8)
            .background(Color(.systemGray6))
            .clipShape(
                RoundedRectangle(cornerRadius: 28)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 28)
                    .stroke(Color(.label), lineWidth: 2.5)
            )
            
            Button {
                searchText = ""
                isSearchActive = false
            } label: {
                Text("Cancel")
                    .foregroundStyle(.mint.opacity(0.7))
            }
        }
        .padding(.horizontal, 8)
    }
    
    private var header: some View {
        HStack {
            Text("Coding Journal")
                .font(.title.bold())
            
            Spacer()
            
            Button {
                isSearchActive = true
            } label: {
                HeaderButton(systemName: "magnifyingglass")
            }
            
            Menu {
                Picker("Sort", selection: $sortOrder) {
                    Text("Date")
                        .tag(SortDescriptor(\Entry.date, order: .reverse))
                        .accessibilityLabel("Sort by date, newest first")
                    
                    Text("Title")
                        .tag(SortDescriptor(\Entry.title))
                        .accessibilityLabel("Sort alphabetically by title")
                    
                    Text("Subtitle")
                        .tag(SortDescriptor(\Entry.subtitle))
                        .accessibilityLabel("Sort alphabetically by subtitle")
                }
            } label: {
                HeaderButton(systemName: "arrow.up.arrow.down")
            }
        }
    }
}

