//
//  DetailedEntryView.swift
//  CodingJournal
//
//  Created by Ismail Larbi Pacha on 10/12/24.
//

import SwiftUI

struct DetailedEntryView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    HStack {
                        Text("Tue, Dec 10 14:18")
                    }
                    
                    Spacer()
                    
                    HStack(spacing: 20) {
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
                        
                        Text("Done")
                            .bold()
                    }
                }
                
                Text("The 1st rule of poetry club")
                    .font(.title2.bold())
                
                Text("""
Yet another great GitHub Classroom Challenge. Here we are learning about the split method mostly. 
The tricky thing is that we had to acknowledge for the empty spaces as well as paying attention to
the fact that this method returns an array of substrings so we would also have to be mindful of the 
return type. So much going on but it was definitely great to solve. I had to resort to the chaining 
of the map method. Using the shorthand syntax we map over each substring and simply convert them to 
strings using Swift’s [...].
"""
                )
                .multilineTextAlignment(.leading)
                
            }
            .padding()
        }
    }
}

#Preview {
    DetailedEntryView()
}
