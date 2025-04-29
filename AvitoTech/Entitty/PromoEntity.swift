//
//  PromoInteractor.swift
//  AvitoTech
//
//  Created by Mrmaks on 31.03.2025.
//

import Foundation
// Модель данных из JSON
struct PromoInformation: Decodable {
    let status: String?
    let result: Result?
}

struct Result: Decodable {
    let title: String
    let actionTitle: String
    let selectedActionTitle: String
    let list: [PromoList]?
}

struct PromoList: Decodable {
    let id: String
    let title: String
    let description: String?
    let icon: Icon
    let price: String
    let isSelected: Bool
}

struct Icon: Decodable {
    let the52x52: String
    
    enum CodingKeys: String, CodingKey {
        case the52x52 = "52x52"
    }
}
