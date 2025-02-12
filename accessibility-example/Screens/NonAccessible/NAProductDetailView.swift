//
//  NAProductDetailView.swift
//  accessibility-example
//
//  Created by Matus Klasovity on 09/01/2025.
//

import SwiftUI

struct NAProductDetailView: View {

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
                } placeholder: {
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 300)
                }


                HStack(spacing: 24) {
                    Button {

                    } label: {
                        Image(systemName: "cart.badge.plus")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 32, height: 32)
                    }

                    Button {

                    } label: {
                        Image(systemName: "heart")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 32, height: 32)
                    }

                    Button {

                    } label: {
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 32, height: 32)
                    }
                }

                Text("Jablko")
                    .font(.title)
                    .fontWeight(.medium)
                    .frame(maxWidth: .infinity, alignment: .leading)

                Text("Jablko je chutné a šťavnaté ovocie plné vitamínov, ideálne na zdravé občerstvenie, pečenie či prípravu smoothie. Ponúkame čerstvé, kvalitné jablká starostlivo vyberané pre váš stôl.")


                Grid {
                    GridRow {
                        VStack {
                            Text("Hmotnosť")
                            Text("125 g")
                        }

                        VStack {
                            Text("Farba")
                            Text("Červená")
                        }
                    }

                    GridRow {
                        VStack {
                            Text("Krajina pôvodu")
                            Text("Slovensko")
                        }

                        VStack {
                            Text("Nutričné hodnoty")
                            Text("52 kcal")
                        }
                    }
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
        }
        .navigationTitle("Jablko")
    }

}

#Preview {
    NavigationStack {
        NAProductDetailView()
    }
}
