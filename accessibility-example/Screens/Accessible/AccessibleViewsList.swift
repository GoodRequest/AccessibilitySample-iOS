//
//  AccessibleViewsList.swift
//  accessibility-example
//
//  Created by Matus Klasovity on 09/01/2025.
//

import SwiftUI

struct AccessibleViewsList: View {

    @State private var searchText = ""

    var body: some View {
        NavigationStack {
            List {
                NavigationLink {
                    AProductDetailView()
                } label: {
                    Text("Detail produktu")
                }

                NavigationLink {
                    ABlursView()
                } label: {
                    Text("Blur a priehľadnosť")
                }

                NavigationLink {
                    AList()
                } label: {
                    Text("Zoznam prvokov")
                }

                NavigationLink {
                    AImagesView()
                } label: {
                    Text("Obrázky")
                }

                NavigationLink {
                    AButtonsView()
                } label: {
                    Text("Tlačidlá")
                }

                NavigationLink {
                    AInputsView()
                } label: {
                    Text("Inputy")
                }

                NavigationLink {
                    ACustomModal()
                } label: {
                    Text("Modal")
                }

                NavigationLink {
                    ARatingView()
                } label: {
                    Text("Rating")
                }

                NavigationLink {
                    AHeadersExampleView()
                } label: {
                    Text("Preskakovanie textu po nadpisoch")
                }

                NavigationLink {
                    ASortPriorityView()
                } label: {
                    Text("Zoradenie a priorita")
                }
            }
            .searchable(text: $searchText)
            .refreshable {
                try! await Task.sleep(nanoseconds: 1_000_000_000)
            }
            .navigationTitle("Prístupné obrazovky")
        }

    }

}

#Preview {
    AccessibleViewsList()
}
