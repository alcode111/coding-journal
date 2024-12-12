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
    @State private var sortOrder = SortDescriptor(\Entry.date, order: .reverse)
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.mainBackground.ignoresSafeArea()
            
                VStack(alignment: .leading) {
                    header
                        .padding(.horizontal, 8)

                    CardEntriesListingView(sort: sortOrder)
                }
                .padding(.top, 40)
                .padding(.horizontal)

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
        }
    }
}

#Preview {
    CardEntriesView()
}

extension CardEntriesView {
    private var header: some View {
        HStack {
            Text("Coding Journal")
                .font(.title.bold())
            
            Spacer()
            
            Button {
                
            } label: {
                ZStack {
                    Circle()
                        .fill(.buttonBackground)
                        .stroke(Color(.label), lineWidth: 2)
                        .frame(width: 35, height: 35)
                    
                    Image(systemName: "magnifyingglass")
                        .font(.callout.bold())
                        .foregroundStyle(Color(.label))
                }
            }
            
            Menu {
                Picker("Sort", selection: $sortOrder) {
                    Text("Date")
                        .tag(SortDescriptor(\Entry.date, order: .reverse))
                    
                    Text("Title")
                        .tag(SortDescriptor(\Entry.title))
                    
                    Text("Subtitle")
                        .tag(SortDescriptor(\Entry.subtitle))
                }
            } label: {
                ZStack {
                    Circle()
                        .fill(.buttonBackground)
                        .stroke(Color(.label), lineWidth: 2)
                        .frame(width: 35, height: 35)
                    
                    Image(systemName: "arrow.up.arrow.down")
                        .font(.callout.bold())
                        .foregroundStyle(Color(.label))
                }
            }
        }
    }
}

