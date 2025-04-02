//
//  PromoInteractor.swift
//  AvitoTech
//
//  Created by Mrmaks on 31.03.2025.
//

import Foundation

func getPromo() async {
    let filePath = "https://avito.tech/api/v1/orders"
    
    do {
        let data = try Data(contentsOf: URL(filePath: filePath))
        let promoProducts = try JSONDecoder().decode([PromoList].self, from: data)
       } catch {
           print(error)
       }
    
    Task {
        await getPromo()
    }
}
