//
//  ContentView.swift
//  AvitoTech
//
//  Created by Mrmaks on 31.03.2025.
//

import SwiftUI
import UIKit
// Главный экран
struct PromoView: View {
    @StateObject private var adapter = PromoPresenterAdapter(interactor: PromoInteractor())

    var body: some View {
        VStack {
            BackButtonView(action: {})
            LargeTitleView(title: adapter.result?.title ?? "")
            AdvertisingView(
                list: adapter.result?.list,
                selectedIndex: adapter.selectedIndex
            ) { index in
                adapter.didSelect(index: index)
            }
            
            Spacer()

            SelectedActionButton(title: adapter.result?.selectedActionTitle ?? "") {
                adapter.tapAction()
            }
        }
        .onAppear {
            adapter.injectView()
        }
        .alert(isPresented: $adapter.showAlert) {
            Alert(
                title: Text("Вы выбрали:"),
                message: Text(adapter.alertTitle ?? ""),
                dismissButton: .default(Text("ОК"))
            )
        }
    }
}


#Preview {
    PromoView()
}
