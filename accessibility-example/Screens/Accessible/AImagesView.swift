//
//  AImagesView.swift
//  accessibility-example
//
//  Created by Matus Klasovity on 13/01/2025.
//

import SwiftUI

struct AImagesView: View {

    @ScaledMetric var height: CGFloat = 100

    var body: some View {
        VStack {
            Image(systemName: "heart")
                .accessibilityHidden(true)

            Image(systemName: "heart.fill")
                .accessibilityLabel("Ikonka srdiečka")

            Image(decorative: "gr-logo")
                .resizable()
                .scaledToFit()
                .frame(height: 100)

            Image(decorative: "gr-logo")
                .resizable()
                .scaledToFit()
                .frame(height: height)
        }
    }

}

#Preview {
    AImagesView()
}
