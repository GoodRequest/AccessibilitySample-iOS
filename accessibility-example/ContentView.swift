//
//  ContentView.swift
//  accessibility-example
//
//  Created by Matus Klasovity on 09/01/2025.
//

import SwiftUI

struct ContentView: View {

    @Environment(\.accessibilityReduceMotion) var reduceMotion
    @Environment(\.accessibilityReduceTransparency) var reduceTransparency


    var body: some View {
        TabView {
            AccessibleViewsList()
                .tabItem {
                    Label("Prístupné obrazovky", systemImage: "person.2.circle")
                }

            NonAccessibleViewsList()
                .tabItem {
                    Label("Neprístupné obrazovky", systemImage: "entry.lever.keypad.trianglebadge.exclamationmark")

                }
        }
    }

}

#Preview {
    ContentView()
}
