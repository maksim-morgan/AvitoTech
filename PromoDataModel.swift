//
//  AvitoModel.swift
//  AvitoTech
//
//  Created by Mrmaks on 31.03.2025.
//

import Foundation
import SwiftUI

import SwiftUI

struct Promo: Identifiable {
    let id: String
    let title: String
    let description: String
    let price: String
    let color: Color
}

struct PromoData {
    static let promos: [Promo] = [
        Promo(
            id: "xl",
            title: "XL-объявление",
            description: "Пользователи смогут посмотреть фотографии, описание и телефон прямо из результатов поиска.",
            price: "356р",
            color: .purple
        ),
        Promo(
            id: "color",
            title: "Выделить цветом",
            description: "Яркий цвет не даст затеряться среди других объявлений",
            price: "299р",
            color: .blue
        )
    ]
}

// MARK: - List
struct PromoList: Decodable {
    let id, title: String
    let description: String?
    let icon: Icon
    let price: String
    let isSelected: Bool
}

// MARK: - Icon
struct Icon: Decodable {
    let the52X52: String

    enum CodingKeys: String, CodingKey {
        case the52X52 = "52x52"
    }
}

