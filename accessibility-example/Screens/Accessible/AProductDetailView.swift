//
//  AProductDetailView.swift
//  accessibility-example
//
//  Created by Matus Klasovity on 09/01/2025.
//

import SwiftUI

struct AProductDetailView: View {

    let productName = "Jablko"
    let productDescription = "Jablko je chutné a šťavnaté ovocie plné vitamínov, ideálne na zdravé občerstvenie, pečenie či prípravu smoothie. Ponúkame čerstvé, kvalitné jablká starostlivo vyberané pre váš stôl."

    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(
                    url: URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQcRfIW5tggAic_wBYqqZstYQzyvi407PIDA&s")
                ) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 300)
                        .accessibilityLabel("Obrázok produktu")
                } placeholder: {
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 300)
                        .accessibilityHidden(true)
                }

                HStack(spacing: 24) {
                    Button {

                    } label: {
                        Image(systemName: "cart.badge.plus")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 32, height: 32)
                    }
                    .accessibilityLabel("Pridať do košíka")

                    Button {

                    } label: {
                        Image(systemName: "heart")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 32, height: 32)
                    }
                    .accessibilityLabel("Pridať do obľúbených")

                    Button {

                    } label: {
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 32, height: 32)
                    }
                    .accessibilityLabel("Zobraziť galériu")
                }

                Text(productName)
                    .accessibilityValue(productName)
                    .accessibilityLabel("Názov produktu")
                    .font(.title)
                    .fontWeight(.medium)
                    .frame(maxWidth: .infinity, alignment: .leading)

                Text(productDescription)
                    .accessibilityLabel("Popis produktu")
                    .accessibilityValue(productDescription)

                Grid {
                    GridRow {
                        VStack {
                            Text("Hmotnosť")
                            Text("125 g")
                        }
                        .accessibilityElement(children: .combine)

                        VStack {
                            Text("Farba")
                            Text("Červená")
                        }
                        .accessibilityElement(children: .combine)
                    }

                    GridRow {
                        VStack {
                            Text("Krajina pôvodu")
                            Text("Slovensko")
                        }
                        .accessibilityElement(children: .combine)


                        VStack {
                            Text("Nutričné hodnoty")
                            Text("52 kcal")
                        }
                        .accessibilityElement(children: .combine)
                    }
                }
            }
            .padding()
            .frame(maxWidth: .infinity)

        }
        .accessibilityAction(.magicTap) {
            print("✅ Pridane")
        }
        .accessibilityAction(named: "Pridať do košíka") {
            print("✅ Pridane")
        }
        .accessibilityAction(named: "Pridať do obľúbených") {
            print("♥️ Pridane")
        }
        .navigationTitle("Jablko")
    }

}

#Preview {
    NavigationStack {
        AProductDetailView()
    }
}

