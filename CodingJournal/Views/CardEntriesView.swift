//
//  CardEntriesView.swift
//  CodingJournal
//
//  Created by Ismaïl on 08/12/2024.
//

import SwiftUI

struct CardEntriesView: View {
    @State private var isShowingEntryModal = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.mainBackground.ignoresSafeArea()
            
            VStack(alignment: .leading) {
                header
                
                ScrollView {
                    VStack {
                        CardView()
                    }
                }
                .ignoresSafeArea(.container, edges: .bottom)
            }
            .padding(.horizontal)
            .padding(.top, 40)
            
            PlusButton(isShowingModal: $isShowingEntryModal)
                .frame(maxWidth: .infinity)
                .background(.ultraThinMaterial)
                .sheet(isPresented: $isShowingEntryModal) {
                    AddNewEntryModal()
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
                        .stroke(.white, lineWidth: 2)
                        .frame(width: 35, height: 35)
                    
                    Image(systemName: "magnifyingglass")
                        .font(.callout.bold())
                        .foregroundStyle(.white)
                }
            }
            
            Button {
                
            } label: {
                ZStack {
                    Circle()
                        .fill(.buttonBackground)
                        .stroke(.white, lineWidth: 2)
                        .frame(width: 35, height: 35)
                    
                    Image(systemName: "arrow.up.arrow.down")
                        .font(.callout.bold())
                        .foregroundStyle(.white)
                }
            }
        }
    }
}

