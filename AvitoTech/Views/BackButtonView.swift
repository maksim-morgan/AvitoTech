//
//  BackButtonView.swift
//  AvitoTech
//
//  Created by Mrmaks on 28.04.2025.
//

import Foundation
import SwiftUI

// Кнопка крестика
struct BackButtonView: View {
    let action: () -> Void

    var body: some View {
        Button(action: {
            action()
        }) {
            Image(systemName: "xmark")
                .foregroundColor(.black)
                .bold()
        }
        .padding(.trailing, Constants.threeHundredFifty)
        .padding(.bottom)
    }
}

extension BackButtonView {
    enum Constants {
        static let threeHundredFifty: CGFloat = 350
        
    }
}
