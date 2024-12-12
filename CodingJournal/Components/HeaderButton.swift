//
//  HeaderButton.swift
//  CodingJournal
//
//  Created by Ismaïl on 12/12/2024.
//

import SwiftUI

struct HeaderButton: View {
    let systemName: String
    
    var body: some View {
        ZStack {
            Circle()
                .fill(.buttonBackground)
                .stroke(Color(.label), lineWidth: 2)
                .frame(width: 44, height: 44)
            
            Image(systemName: systemName)
                .font(.callout.bold())
                .foregroundStyle(Color(.label))
        }
        .contentShape(Circle())
    }
}

#Preview("Header Button", traits: .sizeThatFitsLayout) {
    VStack(spacing: 20) {
        HeaderButton(systemName: "magnifyingglass")
        HeaderButton(systemName: "arrow.up.arrow.down")
        HeaderButton(systemName: "ellipsis")
    }
    .padding()
}
