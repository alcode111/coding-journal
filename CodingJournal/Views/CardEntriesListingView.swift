//
//  CardEntriesListingView.swift
//  CodingJournal
//
//  Created by Ismaïl on 12/12/2024.
//

import SwiftUI
import SwiftData

struct CardEntriesListingView: View {
    @State private var isShowingDetailedViewModal = false
    @State private var selectedEntry: Entry?
    @Query(sort: [
        SortDescriptor(\Entry.date, order: .reverse),
        SortDescriptor(\Entry.title),
        SortDescriptor(\Entry.subtitle)])
    var entries: [Entry]
    
    var body: some View {
        if entries.isEmpty {
            EmptyStateView()
        } else {
            ScrollView {
                VStack {
                    ForEach(entries) { entry in
                        CardView(entry: entry)
                            .onTapGesture {
                                selectedEntry = entry
                                isShowingDetailedViewModal = true
                            }
                            .padding([.horizontal, .vertical], 8)
                    }
                    .fullScreenCover(item: $selectedEntry) { entry in
                        DetailedEntryView(entry: entry)
                    }
                }
            }
            .ignoresSafeArea(.container, edges: .bottom)
            .padding(.bottom, 78)
        }
    }
    
    init(sort: SortDescriptor<Entry>) {
        _entries = Query(sort: [sort])
    }
}

#Preview {
    CardEntriesListingView(sort: SortDescriptor(\Entry.date, order: .reverse))
}
