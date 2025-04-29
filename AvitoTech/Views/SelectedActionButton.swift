//
//  SelectedActionButton.swift
//  AvitoTech
//
//  Created by Mrmaks on 28.04.2025.
//

import Foundation
import SwiftUI

// Кнопка выбора
struct SelectedActionButton: View {
    @StateObject private var adapter = PromoPresenterAdapter(interactor: PromoInteractor())
    let title: String
    let action: () -> Void

    var body: some View {
        Button(title) {
            action()
        }
        .frame(width: Constants.threeHundredFifty, height: Constants.fiftySix)
        .foregroundColor(.white)
        .background(Color.blue)
        .buttonStyle(.bordered)
        .cornerRadius(Constants.twelve)
        .alert(isPresented: $adapter.showAlert) {
            Alert(
                title: Text("Вы выбрали:"),
                message: Text(adapter.alertTitle ?? ""),
                dismissButton: .default(Text("ОК"))
            )
        }
    }
}

extension SelectedActionButton {
    enum Constants {
        static let threeHundredFifty: CGFloat = 350
        static let fiftySix: CGFloat = 56
        static let twelve: CGFloat = 12
    }
}
