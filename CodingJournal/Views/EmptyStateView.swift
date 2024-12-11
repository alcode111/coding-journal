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
            
            Text("Always remember how you solved it")
                .font(.title3.bold())
                .multilineTextAlignment(.center)
                .foregroundStyle(.emptyStateForeground)
            
            Text("Tap the plus button to get started.")
                .font(.title3.bold())
                .multilineTextAlignment(.center)
                .foregroundStyle(.emptyStateForeground)
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .offset(y: -50)
    }
}
#Preview {
    EmptyStateView()
}
