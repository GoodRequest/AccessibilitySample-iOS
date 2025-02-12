//
//  NAContrastView.swift
//  accessibility-example
//
//  Created by Matus Klasovity on 13/01/2025.
//

import SwiftUI

struct NAContrastView: View {

    var body: some View {
        Text("Tu by mal nastať problém s kontrastom")
            .font(.title)
            .foregroundStyle(.blue)
            .padding()
            .background(Color.brown)
    }

}

#Preview {
    NAContrastView()
}
