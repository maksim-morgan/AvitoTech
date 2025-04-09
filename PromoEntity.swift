//
//  PromoInteractor.swift
//  AvitoTech
//
//  Created by Mrmaks on 31.03.2025.
//

import Foundation
// Модель данных из JSON
public struct PromoInformation: Codable, Sendable {
        let status: String?
        let result: Result?
    }
    
    public struct Result: Codable {
        let title: String
        let actionTitle: String
        let selectedActionTitle: String
        let list: [PromoList]?
    }
    
    public struct PromoList: Codable {
        let id: String
        let title: String
        let description: String?
        let icon: Icon
        let price: String
        let isSelected: Bool
    }
    
    public struct Icon: Codable {
        let the52x52: String
        
        enum CodingKeys: String, CodingKey {
            case the52x52 = "52x52"
        }
    }
