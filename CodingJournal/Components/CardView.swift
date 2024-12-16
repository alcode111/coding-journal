//
//  CardView.swift
//  CodingJournal
//
//  Created by Ismail Larbi Pacha on 10/12/24.
//

import SwiftUI

struct CardView: View {
    @Environment(\.modelContext) var modelContext
    
    var entry: Entry
    @State private var isShowingDeleteConfirmation = false
    @State private var isShowingDetailedEntryView = false
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    Text(entry.title)
                        .font(.title3.bold())
                    
                    Text(entry.subtitle)
                        .font(.subheadline)
                        .fontWeight(.medium)
                }
                .padding(.top, 25)
                .padding(.horizontal, 25)
                .padding(.bottom, 8)
                
                Spacer().frame(height: 25)
                
                Rectangle()
                    .frame(maxWidth: .infinity)
                    .frame(height: 2)
                    .foregroundStyle(Color(.label))
                
                HStack {
                    Text(entry.formattedDate)
                        .font(.caption)
                    
                    Spacer()
                    
                    Menu {
                        Button {
                            isShowingDetailedEntryView = true
                        } label: {
                            Label("Edit", systemImage: "pencil")
                        }
                        
                        Button(role: .destructive) {
                            isShowingDeleteConfirmation = true
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }
                        
                    } label: {
                        Image(systemName: "ellipsis")
                            .foregroundStyle(Color(.label))
                            .bold()
                            .frame(width: 44, height: 44)
                            .contentShape(Rectangle())
                    }
                    .padding(.vertical, -8)
                }
                .padding(.horizontal, 25)
                .padding(.bottom, 8)
            }
        }
        .fullScreenCover(isPresented: $isShowingDetailedEntryView) {
            DetailedEntryView(entry: entry)
        }
        .background(.cardBackground)
        .clipShape(RoundedRectangle(cornerRadius: 28))
        .overlay(
            RoundedRectangle(cornerRadius: 28)
                .stroke(Color(.label), lineWidth: 2.5)
        )
        .padding(2)
        .confirmationDialog("Delete Entry", isPresented: $isShowingDeleteConfirmation, titleVisibility: .visible) {
            Button("Delete", role: .destructive) {
                withAnimation {
                    modelContext.delete(entry)
                }
            }
            Button("Cancel", role: .cancel) {}
        } message: {
            Text("Are you sure you want to delete this entry? This action cannot be undone.")
        }
    }
}

#Preview {
    CardView(entry: Entry(title: "The 1st rule of Poetry Club", subtitle: "GitHub Classroom", date: Date.now, details: ""))
}
