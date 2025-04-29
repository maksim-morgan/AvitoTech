//
//  PromoPresenterAdapter.swift
//  AvitoTech
//
//  Created by Mrmaks on 09.04.2025.
//

import Foundation
//  Adapter связывает SwiftUI и Presenter
final class PromoPresenterAdapter: ObservableObject, PromoViewProtocol {
    @Published var result: Result?
    @Published var alertTitle: String?
    @Published var showAlert = false
    @Published var selectedIndex: Int?

    private var presenter: PromoPresenter

    init(interactor: PromoInteractor) {
        self.presenter = PromoPresenter(interactor: interactor)
    }

    func injectView() {
        presenter.setView(self)
        presenter.onAppear()
    }

    func display(result: Result) {
        self.result = result
    }

    func showAlert(title: String) {
        alertTitle = title
        showAlert = true
    }

    func didSelect(index: Int) {
        selectedIndex = index
    }

    func tapAction() {
        if let index = selectedIndex, let title = result?.list?[index].title {
            showAlert(title: title)
        } else {
            showAlert(title: "Вы не выбрали услугу")
        }
    }
}
