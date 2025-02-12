//
//  AButtonsView.swift
//  accessibility-example
//
//  Created by Matus Klasovity on 13/01/2025.
//

import SwiftUI

struct AButtonsView: View {

    var body: some View {
        VStack {
            Button {
                //
            } label: {
                Image(systemName: "heart")
            }
            .accessibilityLabel("Pridať do obľúbených")

            Text("Detail")
                .onTapGesture {
                    //
                }
                .accessibilityLabel("Detail produktu")
                .accessibilityAddTraits(.isButton)

            Button("Odstrániť") {
                // Akcia
            }
            .accessibilityLabel("Odstrániť položku")
            .accessibilityHint("Týmto tlačidlom trvalo odstránite položku zo zoznamu. Akcia je nevratná.")
        }
    }

}

#Preview {
    AButtonsView()
}
