//
//  ASortPriorityView.swift
//  accessibility-example
//
//  Created by Matus Klasovity on 13/02/2025.
//

import SwiftUI

struct ASortPriorityView: View {

    var body: some View {
        ScrollView {
            VStack(spacing: 32) {

                Text("Tento text sa prečíta ako tretí")
                    .font(.headline)
                    .accessibilitySortPriority(3)

                Text("Tento text sa prečíta ako druhý")
                    .fontWeight(.semibold)
                    .font(.title)
                    .accessibilitySortPriority(4)

                Text("Tento text sa prečíta ako prvý")
                    .bold()
                    .font(.largeTitle)
                    .accessibilitySortPriority(5)

                Text("Tento text sa prečíta ako štvrtý")
                    .font(.subheadline)
                    .accessibilitySortPriority(2)

                Text("Tento text sa prečíta ako piaty")
                    .font(.caption)
                    .accessibilitySortPriority(1)
            }
            .multilineTextAlignment(.center)
            .padding()
        }
    }

}

#Preview {
    ASortPriorityView()
}
