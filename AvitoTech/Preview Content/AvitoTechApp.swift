//
//  AvitoTechApp.swift
//  AvitoTech
//
//  Created by Mrmaks on 31.03.2025.
//

import SwiftUI

@main
struct AvitoTechApp: App {
    var body: some Scene {
        WindowGroup {
            PromoView(viewModel: PromoPresenterAdapter(interactor: PromoInteractor()))
        }
    }
}
