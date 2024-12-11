//
//  CardView.swift
//  CodingJournal
//
//  Created by Ismail Larbi Pacha on 10/12/24.
//

import SwiftUI

struct CardView: View {
    let entry: Entry
    
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
                    .foregroundStyle(.white)
                
                HStack {
                    Text(entry.formattedDate)
                        .font(.caption)
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "ellipsis")
                            .foregroundStyle(.white)
                            .bold()
                    }
                }
                .padding(.horizontal, 25)
                .padding(.bottom, 8)
            }
        }
        .background(.cardBackground)
        .clipShape(RoundedRectangle(cornerRadius: 28))
        .overlay(
            RoundedRectangle(cornerRadius: 28)
                .stroke(.white, lineWidth: 2.5)
            )
        .padding(2)
    }
}

#Preview {
    CardView(entry: Entry(title: "The 1st rule of Poetry Club", subtitle: "GitHub Classroom", date: Date.now, details: ""))
}
