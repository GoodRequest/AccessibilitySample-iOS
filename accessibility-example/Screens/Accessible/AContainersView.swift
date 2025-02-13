//
//  AContainersView.swift
//  accessibility-example
//
//  Created by Matus Klasovity on 13/02/2025.
//

import SwiftUI

struct AContainersView: View {
    var body: some View {
        ScrollView {
            VStack {
                VStack(alignment: .leading) {
                    Text("Preskakovanie segmentov pomocou kontajnerov")
                        .font(.title)
                        .accessibilityAddTraits(.isHeader)

                    Text("Pomocou rotora vieme preskakovať segmenty tak, že vyberieme možnosť 'Kontajner'. Poznáme 3 typy kontajnerov")

                    Text("- **Combine**: kombinuje všetky deti do jedného prvku. VoiceOver číta všetky deti naraz. Neumožňuje preskakovanie medzi deťmi.")
                    Text("- **Ignore**: ignoruje všetky deti a číta len prvok sám.")
                    Text("- **Contain**: číta všetky deti ako samostatné prvky. Umožňuje preskakovanie medzi deťmi swipovaním vľavo a vpravo.")
                }
                .accessibilityElement(children: .contain)
                .background(Color.blue.opacity(0.2))

                Text("Tento text je mimo kontajnerov")
                    .padding()
                    .font(.title)
                    .accessibilityAddTraits(.isHeader)


                VStack(alignment: .leading) {
                    Text("Toto je kontajner s typom 'Combine'")
                        .font(.title)
                        .accessibilityAddTraits(.isHeader)

                    Text("Nedá sa tu preskakovať medzi deťmi")
                        .padding()

                    Text("Voiceover číta všetky deti naraz")
                        .padding()

                    Text("Ak chceme aby ho VoiceOver zaradil medzi prvky, keď preskakujeme segmenty, musíme mu pridať modifikátor '.accessibilityElement(children: .combine)'")
                        .padding()
                }
                .accessibilityElement(children: .combine)
                .accessibilityElement(children: .contain)
                .background(Color.red.opacity(0.2))

                Text("Aj tento text je mimo kontajnerov")
                    .padding()
                    .font(.title)
                    .accessibilityAddTraits(.isHeader)

                VStack(alignment: .leading) {
                    Text("Toto je kontajner s typom 'Ignore'")
                        .font(.title)
                        .accessibilityAddTraits(.isHeader)

                    Text("VoiceOver by ho mal ignorovať")
                        .padding()
                }
                .background(Color.green.opacity(0.2))
                .accessibilityElement(children: .ignore)
                .accessibilityLabel("VoiceOver ignoruje tento kotajner pri preskakovaní prvokov. Číta len v prípade, že je priamo vybraný. Ak ho chceme ignorovať úplne, musíme použiť modifikátor '.accessibilityHidden'")

                Text("Posledný text mimo kontajnerov")
                    .padding()
                    .font(.title)
                    .accessibilityAddTraits(.isHeader)

                VStack(alignment: .leading) {
                    Text("Toto je kontajner s typom 'Contain'")
                        .font(.title)
                        .accessibilityAddTraits(.isHeader)

                    Text("Medzi deťmi sa dá preskakovať swipovaním vľavo a vpravo")
                        .padding()
                }
                .accessibilityElement(children: .contain)
                .background(Color.yellow.opacity(0.2))
            }
            .padding()
        }
    }
}

#Preview {
    AContainersView()
}
