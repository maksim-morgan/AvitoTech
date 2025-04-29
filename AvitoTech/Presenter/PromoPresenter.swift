//
//  PromoPresenter.swift
//  AvitoTech
//
//  Created by Mrmaks on 09.04.2025.
//

import Foundation

protocol PromoViewProtocol: AnyObject {
    func display(result: Result)
    func showAlert(title: String)
}
// Presenter
final class PromoPresenter {
    private weak var view: PromoViewProtocol?
    private let interactor: PromoInteractor

    init(view: PromoViewProtocol? = nil, interactor: PromoInteractor) {
        self.view = view
        self.interactor = interactor
    }

    func setView(_ view: PromoViewProtocol) {
        self.view = view
    }

    func onAppear() {
        Task {
            await interactor.fetchPromos()

            if let result = interactor.promoResult {
                DispatchQueue.main.async {
                    self.view?.display(result: result)
                }
            }
        }
    }
}
