//
//  NonAccessibleViewsList.swift
//  accessibility-example
//
//  Created by Matus Klasovity on 09/01/2025.
//

import SwiftUI

struct NonAccessibleViewsList: View {

    var body: some View {
        NavigationStack {
            List {
                NavigationLink {
                    NAProductDetailView()
                } label: {
                    Text("Product detail")
                }

                NavigationLink {
                    NAContrastView()
                } label: {
                    Text("Kontrast")
                }

                NavigationLink {
                    NACustomModal()
                } label: {
                    Text("Modal")
                }

                NavigationLink {
                    NAInputsView()
                } label: {
                    Text("Inputy")
                }

                NavigationLink {
                    NARatingView()
                } label: {
                    Text("Rating")
                }

                NavigationLink {
                    NACustomList()
                } label: {
                    Text("Vlastný zoznam")
                }
            }
            .navigationTitle("Neprístupné obrazovky")
        }
    }

}

#Preview {
    NonAccessibleViewsList()
}

