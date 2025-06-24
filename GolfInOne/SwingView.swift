//
//  SwingView.swift
//  GolfInOne
//
//  Created by William Chandler on 20.06.25.
//

import SwiftUI

struct SwingPosition: Identifiable, Hashable {
    let id: String
    let description: String
    
    init(id: String, description: String) {
        self.id = id
        self.description = description
        
    }
}

let swingPositions = [
    SwingPosition(id: "P1", description: "Address"),
    SwingPosition(id: "P2", description: "Takeaway"),
    SwingPosition(id: "P3", description: "Halfway Back"),
    SwingPosition(id: "P4", description: "Top of Backswing"),
    SwingPosition(id: "P5", description: "Early Downswing"),
    SwingPosition(id: "P6", description: "Pre-Impact"),
    SwingPosition(id: "P7", description: "Impact"),
    SwingPosition(id: "P8", description: "Release"),
    SwingPosition(id: "P9", description: "Finish"),
    SwingPosition(id: "P10", description: "End of Swing")
    ]

struct SwingView: View {
    var body: some View {
        NavigationStack {
            List {
                ForEach(swingPositions) { position in
                    NavigationLink {
                        SwingPositionView(position: position)
                    } label: {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(position.id)
                                    .font(.headline)
                                Text(position.description)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Swing Positions")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    SwingView()
}
