//
//  ButtonStyles.swift
//  CodingJournal
//
//  Created by Ismaïl on 12/12/2024.
//

import SwiftUI

struct CardPressButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.98 : 1.0)
            .animation(.spring(duration: 0.2), value: configuration.isPressed)
    }
}

#Preview("Card Press Button Style", traits: .sizeThatFitsLayout) {
    VStack(spacing: 20) {
        Button("Regular Button") { }
            .buttonStyle(CardPressButtonStyle())
            .padding()
            .background(.blue)
            .foregroundStyle(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        
        Button(action: {}) {
            VStack(alignment: .leading) {
                Text("Sample Card")
                    .font(.title3.bold())
                Text("Subtitle")
                    .font(.subheadline)
                Spacer()
                Text("Press me to see the effect")
            }
            .frame(width: 200, height: 150)
            .padding()
            .background(.gray.opacity(0.2))
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        .buttonStyle(CardPressButtonStyle())
    }
    .padding()
}
