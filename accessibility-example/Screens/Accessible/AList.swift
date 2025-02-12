//
//  AList.swift
//  accessibility-example
//
//  Created by Matus Klasovity on 13/01/2025.
//

import SwiftUI

struct AList: View {

    @State private var users = ["Glenn", "Malcolm", "Nicola", "Terri"]

    var body: some View {
        List($users, id: \.self, editActions: .delete) { $user in
            NavigationLink {
                Text("Detail užívateľa: \(user)")
            } label: {
                HStack {
                    Image(systemName: "photo")
                        .accessibilityHidden(true)

                    Text(user)
                }
            }
            .accessibilityHint(Text("Kliknutím zobrazíte detail užívateľa"))
        }
        .navigationTitle("Zoznam užívateľov")
    }

}

#Preview {
    AList()
}
