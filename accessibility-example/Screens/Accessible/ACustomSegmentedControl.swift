//
//  ACustomSegmentedControl.swift
//  accessibility-example
//
//  Created by Matus Klasovity on 06/03/2025.
//

import SwiftUI

struct ACustomSegmentedControl: View {

    @State var selectedSegment = 0

    var body: some View {
        HStack(spacing: 4) {
            ForEach(0..<6) { index in
                Button(action: { }) {
                    Color.blue
                        .opacity(index == selectedSegment ? 1 : 0.5)
                        .scaleEffect(index == selectedSegment ? 1.2 : 1)
                        .frame(width: 16, height: 16)
                        .clipShape(Circle())
                }
            }
        }
        .accessibilityRepresentation {
            Picker("Vybraný segment", selection: $selectedSegment) {
                ForEach(0..<6) { index in
                    Text("Segment \(index)")
                }
            }
            .pickerStyle(.segmented)
        }
    }

}

#Preview {
    ACustomSegmentedControl()
}
