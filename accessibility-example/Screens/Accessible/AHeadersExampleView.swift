//
//  AHeadersExampleView.swift
//  accessibility-example
//
//  Created by Matus Klasovity on 13/02/2025.
//

import SwiftUI

struct AHeadersExampleView: View {

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Nastavenie hlavičiek pre voiceover")
                .font(.largeTitle)
                .accessibilityAddTraits(.isHeader)
                .accessibilityHeading(.h1)

            Text("Ako nastaviť správne označenia hlavičiek pre VoiceOver?")
                .font(.title2)
                .bold()
                .accessibilityAddTraits(.isHeader)
                .accessibilityHeading(.h2)

            Text("Musíme použiť metódu accessibilityAddTraits(.isHeader) a prípdane nastaviť vhodný heading. V tomto prípade h1.")
                .padding()

            Text("Ako aktivovať preskakovanie textu po hlavičkách?")
                .font(.title2)
                .bold()
                .accessibilityAddTraits(.isHeader)
                .accessibilityHeading(.h2)

            Text("V accessibility rotore vybrať možnosť Hlavičky/Heading. Následne môžeme preskakovať medzi hlavičkami pomocou swipe up/down.")
                .padding()

            Text("Sekcia 2")
                .font(.title2)
                .bold()
                .accessibilityAddTraits(.isHeader)
                .accessibilityHeading(.h2)

            Text("Obsah sekcie 2 s ďalšími informáciami.")
                .padding()
        }
        .padding()
    }

}
