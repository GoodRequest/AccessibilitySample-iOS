//
//  ABlursView.swift
//  accessibility-example
//
//  Created by Matus Klasovity on 13/01/2025.
//

import SwiftUI

struct ABlursView: View {

    @Environment(\.accessibilityReduceTransparency) var reduceTransparency

    var body: some View {
        VStack {
            Text("V prípade, že používateľ má zapnutú funkciu redukcie transparentnosti, mali by sme zmeniť blur efekty na inú formu prezentácie, ktorá bude pre používateľa zrozumiteľná. Taktiež bz sme mali zvážiť zmenu opacity pre niektoré prvky.")
                .padding()

            Text(reduceTransparency ? "Transparentnost je vypnutá" : "Transparentnost je zapnutá")
                .padding()
                .background(textBackground(reduceTransparency: reduceTransparency))

            Rectangle()
                .fill(reduceTransparency ? Color.black : Color.black.opacity(0.5))
                .frame(width: 200, height: 200)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.red.opacity(0.2).ignoresSafeArea())
    }

}

private extension ABlursView {

    @ViewBuilder
    func textBackground(reduceTransparency: Bool) -> some View {
        if reduceTransparency {
            Rectangle()
                .fill(Color.gray)
        } else {
            Rectangle()
                .background(.ultraThinMaterial)
        }
    }

}

#Preview {
    ABlursView()
}
