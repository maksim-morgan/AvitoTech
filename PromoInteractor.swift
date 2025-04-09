//
//  PromoInteractor.swift
//  AvitoTech
//
//  Created by Mrmaks on 09.04.2025.
//

import Foundation

public class PromoInteractor: ObservableObject {
   @Published var promoResult: Result?
   // Функция для загрузки данных из сети
   func fetchPromos() async {
       do {
           let url = URL(string: "https://catfact.ninja/fact")!
           let (data, _) = try await URLSession.shared.data(from: url)
           let promoInfo = try JSONDecoder().decode(PromoInformation.self, from: data)
           print(promoInfo.result?.list? [1].description ?? "Нет заголовка")
           DispatchQueue.main.async {
               self.promoResult = promoInfo.result
           }
       } catch {
           print("Ошибка запроса или декодирования: \(error)")
       }
   }
}
