//
//  SwingPositionView.swift
//  AllGolfApp
//
//  Created by William Chandler on 20.06.25.
//

import SwiftUI

struct SwingPositionView: View {
    let position: SwingPosition
    
    var body: some View {
        let test = "test"
        //ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                Image(position.id.lowercased())
                    .resizable()
                    .scaledToFit()
                Group {
                    Text(position.description)
                        .padding(.vertical)
                    Text("Describe swing position here...")
                        .font(.headline)
                }
                .padding(.horizontal)
                /*
                Button(marked.contains(position) ? "Remove from Marked" : "Add to Marked") {
                    if marked.contains(position) {
                        marked.remove(position)
                    } else {
                        marked.add(position)
                    }
                }
                .buttonStyle(.borderedProminent)
                .padding()
                 */
            }
            .navigationTitle("\(position.id) - \(position.description)")
            .navigationBarTitleDisplayMode(.inline)
        //}
    }
}

#Preview {
    SwingPositionView(position: SwingPosition(id: "test", description: "test"))
}
