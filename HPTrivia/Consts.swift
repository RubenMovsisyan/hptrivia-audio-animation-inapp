//
//  Consts.swift
//  HPTrivia
//
//  Created by Ruben Movsisyan on 4/1/24.
//

import Foundation
import SwiftUI

enum Consts {
    static let hpFont = "PartyLetPlain"
}

struct InfoBackgroundImage: View {
    var body: some View {
        Image("parchment")
            .resizable()
            .ignoresSafeArea()
            .background(.brown)
    }
}

extension Button {
    func doneButton() -> some View {
        self
        .font(.largeTitle)
        .padding()
        .buttonStyle(.borderedProminent)
        .tint(.brown)
        .foregroundStyle(.white)
    }
}
