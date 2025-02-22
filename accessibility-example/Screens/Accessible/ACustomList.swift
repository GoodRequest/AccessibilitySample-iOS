//
//  ACustomList.swift
//  accessibility-example
//
//  Created by Matus Klasovity on 13/02/2025.
//

import SwiftUI

struct ACustomList: View {

    @Observable
    final class Email: Identifiable {
        let id: UUID
        let subject: String
        let body: String
        var isRead: Bool

        init(id: UUID, subject: String, body: String, isRead: Bool) {
            self.id = id
            self.subject = subject
            self.body = body
            self.isRead = isRead
        }
    }

    @State var emails = [
        Email(id: UUID(), subject: "Ahoj", body: "Ahoj, ako sa máš?", isRead: true),
        Email(id: UUID(), subject: "Schôdzka", body: "Máme schôdzku zajtra", isRead: false),
        Email(id: UUID(), subject: "Párty", body: "Nevynechaj párty", isRead: true),
        Email(id: UUID(), subject: "Nová práca", body: "Máme pre teba novú prácu", isRead: true),
        Email(id: UUID(), subject: "Dovolenka", body: "Poďme na dovolenku", isRead: false),
        Email(id: UUID(), subject: "Reklama", body: "Kúpte si túto super vec", isRead: true),
        Email(id: UUID(), subject: "Víťazstvo", body: "Vyhrali sme", isRead: false),
        Email(id: UUID(), subject: "Výhra", body: "Vyhrávate 1000€", isRead: false),
    ]

    @Namespace var namespace


    var body: some View {
        ScrollView {
            VStack {
                ForEach(emails) { email in
                    emailView(email: email)
                        .accessibilityRotorEntry(id: email.id, in: namespace)

                    Divider()
                }
            }
            .accessibilityElement(children: .contain)
            .accessibilityRotor("Neprečítané E-maily") {
                ForEach(emails) { email in
                    if !email.isRead {
                        AccessibilityRotorEntry(LocalizedStringKey(stringLiteral: email.subject), id: email.id, in: namespace)
                    }
                }
            }
        }
    }
}

extension ACustomList {

    func emailView(email: Email) -> some View {
        HStack {
            Image(systemName: email.isRead ? "envelope.open.fill" : "envelope.fill")
                .foregroundColor(email.isRead ? .gray : .blue)
                .accessibilityLabel(email.isRead ? "Prečítaný email" : "Neprečítaný email")

            VStack(alignment: .leading) {
                Text(email.subject)
                    .font(.headline)
                    .accessibilityLabel("Predmet: \(email.subject)")

                Text(email.body)
                    .font(.subheadline)
                    .accessibilityLabel("Telo správy: \(email.body)")
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            Menu {
                Button {
                    email.isRead.toggle()
                } label: {
                    Label("Označiť ako prečítané", systemImage: "envelope.open.fill")
                }

                Button(role: .destructive) {
                    withAnimation {
                        emails.removeAll(where: { $0.id == email.id })
                    }
                } label: {
                    Label("Zmazať", systemImage: "trash")
                }

            } label: {
                Image(systemName: "ellipsis")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .accessibilityElement(children: .combine)
    }

}


#Preview {
    ACustomList()
}
