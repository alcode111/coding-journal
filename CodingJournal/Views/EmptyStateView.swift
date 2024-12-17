//
//  EmptyStateView.swift
//  CodingJournal
//
//  Created by Ismaïl on 11/12/2024.
//

import SwiftUI

struct EmptyStateView: View {
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            
            Text("Keep track of your coding")
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .accessibilityAddTraits(.isHeader)
            
            Text("Always remember how you solved it")
                .font(.title3.bold())
                .multilineTextAlignment(.center)
                .foregroundStyle(.emptyStateForeground)
                .accessibilityLabel("Subtitle: Always remember how you solved it")
            
            Text("Tap the plus button to get started")
                .font(.title3.bold())
                .multilineTextAlignment(.center)
                .foregroundStyle(.emptyStateForeground)
                .accessibilityLabel("Instructions: Tap the plus button to get started")
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .offset(y: -50)
        .accessibilityElement(children: .combine)
        .accessibilityLabel("Empty journal state")
    }
}
#Preview {
    EmptyStateView()
}
