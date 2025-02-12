//
//  AInputsView.swift
//  accessibility-example
//
//  Created by Matus Klasovity on 13/01/2025.
//

import SwiftUI

struct AInputsView: View {

    @State private var email: String = ""
    @State private var volume = 20.0
    @State private var isChecked = false
    @State private var error: String? = nil

    @FocusState private var isFocused: Bool

    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("* Email")
                    .accessibilityHidden(true)

                TextField("*Email", text: $email)
                    .keyboardType(.emailAddress)
                    .accessibilityLabel("E-mailová adresa")
                    .accessibilityValue(email)
                    .padding(.vertical, 8)
                    .padding(.horizontal, 12)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(.gray, lineWidth: 1)
                    )
                    .focused($isFocused)

                if let error {
                    Text(error)
                        .foregroundColor(.red)
                        .accessibilityLabel("Chyba: \(error)")
                }
            }


            Slider(value: $volume, in: 0...100)
                .accessibilityLabel("Hlasitosť")
                .accessibilityValue("\(Int(volume)) percent")

            Toggle("Povoliť notifikácie", isOn: .constant(true))


            CustomCheckbox(isChecked: $isChecked)
                .accessibilityLabel("Súhlas s podmienkami")

            Button {
                if !email.isEmpty && !email.contains("@") {
                    error = "Neplatná e-mailová adresa"
                    isFocused = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        UIAccessibility.post(notification: .announcement, argument: error)
                    }
                } else {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        UIAccessibility.post(notification: .announcement, argument: "Formulár úspešne odoslaný")
                    }
                }
            } label: {
                Text("Odoslať")
            }
            .accessibilityHint(Text("Odoslanním sa Vám vytvorí účet"))
//            .disabled(email.isEmpty || !email.contains("@"))
        }
        .accessibilityActions {
            if isFocused {
                Button("Zavrieť klávesnicu") {
                    isFocused = false
                }
            }
        }
        .padding()
    }

}

struct CustomCheckbox: View {

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
        .accessibilityAddTraits(.isToggle)
        .accessibilityRemoveTraits(.isButton)
        .accessibilityAddTraits(isChecked ? [.isSelected] : [])
    }

}

#Preview {
    AInputsView()
}
