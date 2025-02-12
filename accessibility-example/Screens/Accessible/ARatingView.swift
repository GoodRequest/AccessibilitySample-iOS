//
//  ARatingView.swift
//  accessibility-example
//
//  Created by Matus Klasovity on 06/02/2025.
//

import SwiftUI

struct ARatingView: View {
    
    @State var rating: Int = 1

    var body: some View {
        HStack {
            ForEach(1..<6) { index in
                Button(action: { rating = index }) {
                    Image(systemName: index <= rating ? "star.fill" : "star")
                }
            }
        }
        .accessibilityElement()
        .accessibilityLabel(Text("Hodnotenie"))
        .accessibilityValue(Text(String(rating) + " z 5"))
        .accessibilityAdjustableAction { direction in
            switch direction {
            case .increment:
                guard rating < 5 else { break }
                rating += 1
            case .decrement:
                guard rating > 1 else { break }
                rating -= 1
            @unknown default:
                break
            }
        }
    }

}
