//
//  AddNewEntryModal.swift
//  CodingJournal
//
//  Created by Ismail Larbi Pacha on 10/12/24.
//

import SwiftUI

struct AddNewEntryModal: View {
    @Environment(\.dismiss) var dismiss
    @State private var title = ""
    @State private var details = ""
    
    var body: some View {
        ZStack {
            Color.mainBackground.opacity(0.5).ignoresSafeArea()
            
            ScrollView {
                VStack {
                    HStack {
                        Spacer()
                        Spacer()
                        
                        Text("\(Date.now, format: .dateTime.weekday(.abbreviated).month(.abbreviated).day())")
                            .bold()
                        
                        Spacer()
                        
                        HStack {
                            Button {
                                
                            } label: {
                                ZStack {
                                    Circle()
                                        .fill(.mainBackground)
                                        .frame(width: 25, height: 25)
                                    
                                    Circle()
                                        .stroke(.white, lineWidth: 2)
                                        .frame(width: 25, height: 25)
                                    
                                    Text("⋯")
                                        .foregroundStyle(.white)
                                        .font(.system(size: 14, weight: .bold))
                                        .offset(y: -0.5)
                                }
                            }
                            
                            Spacer()
                            
                            Button {
                                dismiss()
                            } label: {
                                Text("Done")
                                    .foregroundStyle(.white)
                                    .bold()
                            }
                        }
                        .frame(width: 100)
                        
                    }
                    .padding(.horizontal, 8)
                    
                    TextField("Title", text: $title)
                    
                    Divider()
                    
                    TextField("Start writing...", text: $details, axis: .vertical)
                }
                .padding()
            }
        }
    }
}

#Preview {
    AddNewEntryModal()
}
