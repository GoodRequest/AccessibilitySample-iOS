//
//  ACustomList.swift
//  accessibility-example
//
//  Created by Matus Klasovity on 13/02/2025.
//

import SwiftUI

struct ACustomList: View {

    struct Email: Identifiable {
        let id: UUID
        let subject: LocalizedStringKey
        let body: String
        let isRead: Bool
    }

    let emails = [
        Email(id: UUID(), subject: "Ahoj", body: "Ahoj, ako sa máš?", isRead: true),
        Email(id: UUID(), subject: "Schôdzka", body: "Máme schôdzku zajtra", isRead: false),
        Email(id: UUID(), subject: "Párty", body: "Nevynechaj párty", isRead: true),
        Email(id: UUID(), subject: "Nová práca", body: "Máme pre teba novú prácu", isRead: true),
        Email(id: UUID(), subject: "Dovolenka", body: "Choďme na dovolenku", isRead: false),
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
                        AccessibilityRotorEntry(email.subject, id: email.id, in: namespace)
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
            VStack(alignment: .leading) {
                Text(email.subject)
                    .font(.headline)
                Text(email.body)
                    .font(.subheadline)
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
