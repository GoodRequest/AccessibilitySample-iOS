//
//  NARatingView.swift
//  accessibility-example
//
//  Created by Matus Klasovity on 06/02/2025.
//

import SwiftUI

struct NARatingView: View {

    @State var rating: Int = 1

    var body: some View {
        HStack {
            ForEach(1..<6) { index in
                Button(action: { rating = index }) {
                    Image(systemName: index <= rating ? "star.fill" : "star")
                }
            }
        }
    }

}
