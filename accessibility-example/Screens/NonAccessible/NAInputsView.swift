//
//  NAInputsView.swift
//  accessibility-example
//
//  Created by Matus Klasovity on 06/02/2025.
//

import SwiftUI

struct NAInputsView: View {

    @State private var email: String = ""
    @State private var volume = 20.0
    @State private var isChecked = false

    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("* Email")

                TextField("*Email", text: $email)
                    .keyboardType(.emailAddress)
                    .padding(.vertical, 8)
                    .padding(.horizontal, 12)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(.gray, lineWidth: 1)
                    )

                if !email.isEmpty && !email.contains("@") {
                    Text("Neplatná e-mailová adresa")
                        .foregroundColor(.red)
                }
            }

            Slider(value: $volume, in: 0...200)

            Toggle("Povoliť notifikácie", isOn: .constant(true))


            NACustomCheckbox(isChecked: $isChecked)

            Button {

            } label: {
                Text("Odoslať")
            }
            .disabled(email.isEmpty || !email.contains("@"))
        }
        .padding()
    }

}

struct NACustomCheckbox: View {

    @Binding var isChecked: Bool

    var body: some View {
        Button {
            isChecked.toggle()
        } label: {
            Image(systemName: isChecked ? "checkmark.square" : "square")
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
        }
    }

}

#Preview {
    AInputsView()
}

