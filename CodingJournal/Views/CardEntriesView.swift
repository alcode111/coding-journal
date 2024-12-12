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
    @State private var isShowingDetailedViewModal = false
    @State private var selectedEntry: Entry?
    @Query var entries: [Entry]
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.mainBackground.ignoresSafeArea()
            
                VStack(alignment: .leading) {
                    header
                        .padding(.horizontal, 8)

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
            
            Button {
                
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

