//
//  LargeTitleView.swift
//  AvitoTech
//
//  Created by Mrmaks on 28.04.2025.
//

import Foundation
import SwiftUI
// Сделайте объявление заметнее на 7 дней
struct LargeTitleView: View {
    let title: String

    var body: some View {
        Text(title)
            .font(.largeTitle)
            .bold()
            .padding(.bottom, Constants.forty)
            .lineLimit(nil)
            .fixedSize(horizontal: false, vertical: true)
    }
}

extension LargeTitleView {
    enum Constants {
        static let forty: CGFloat = 40
        static let threeHundredFifty: CGFloat = 350
        static let fiftySix: CGFloat = 56
        static let twelve: CGFloat = 12
    }
}
