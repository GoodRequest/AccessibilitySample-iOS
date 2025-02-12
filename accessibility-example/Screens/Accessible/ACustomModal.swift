//
//  ACustomModal.swift
//  accessibility-example
//
//  Created by Matus Klasovity on 13/01/2025.
//

import SwiftUI

struct ACustomModal: View {

    @State private var isModalPresented = false

    var body: some View {
        ZStack {
            Button("Zobraziť modálny dialóg") {
                isModalPresented.toggle()
            }

            if isModalPresented {
                VStack {
                    VStack {
                        Button("Zavrieť dialóg", systemImage: "xmark") {
                            isModalPresented.toggle()
                        }

                        Text("Tu je modálny dialóg")
                            .foregroundStyle(.black)
                            .padding()
                    }
                    .background(Color.white)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.black.opacity(0.5))
                .accessibilityAddTraits(.isModal)
            }
        }
        .accessibilityAction(.escape) {
            isModalPresented = false
        }
    }

}
