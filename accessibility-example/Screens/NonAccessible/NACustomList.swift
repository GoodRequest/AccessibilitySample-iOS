//
//  NACustomList.swift
//  accessibility-example
//
//  Created by Matus Klasovity on 13/02/2025.
//

import SwiftUI

struct NACustomList: View {

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
        Email(id: UUID(), subject: "Dovolenka", body: "Choďme na dovolenku", isRead: false),
        Email(id: UUID(), subject: "Reklama", body: "Kúpte si túto super vec", isRead: true),
        Email(id: UUID(), subject: "Víťazstvo", body: "Vyhrali sme", isRead: false),
        Email(id: UUID(), subject: "Výhra", body: "Vyhrávate 1000€", isRead: false),
    ]


    var body: some View {
        ScrollView {
            VStack {
                ForEach(emails) { email in
                    emailView(email: email)

                    Divider()
                }
            }
        }
    }
}

extension NACustomList {

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
    }

}


#Preview {
    ACustomList()
}

