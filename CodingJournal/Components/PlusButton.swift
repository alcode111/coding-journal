//
//  PlusButton.swift
//  CodingJournal
//
//  Created by Ismail Larbi Pacha on 10/12/24.
//

import SwiftUI

struct PlusButton: View {
    @Binding var isShowingModal: Bool
    
    var body: some View {
        Button {
            isShowingModal.toggle()
        } label: {
            ZStack {
                Circle()
                    .fill(.mainBackground)
                    .frame(width: 70, height: 70)
                    .overlay {
                        Circle()
                            .stroke(.white, lineWidth: 2)
                    }
                
                Image(systemName: "plus")
                    .font(.title.bold())
                    .foregroundStyle(.white)
            }
        }
    }
}

#Preview {
    PlusButton(isShowingModal: .constant(false))
}
