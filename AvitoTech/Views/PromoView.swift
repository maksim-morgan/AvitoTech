//
//  ContentView.swift
//  AvitoTech
//
//  Created by Mrmaks on 31.03.2025.
//

import SwiftUI

// Главный экран
struct PromoView: View {
    @ObservedObject var viewModel: PromoPresenterAdapter

    var body: some View {
        VStack {
            BackButtonView(action: {})
            LargeTitleView(title: viewModel.result?.title ?? "")
            AdvertisingView(
                list: viewModel.result?.list,
                selectedIndex: viewModel.selectedIndex
            ) { index in
                viewModel.didSelect(index: index)
            }
            
            Spacer()

            SelectedActionButton(title: viewModel.result?.selectedActionTitle ?? "") {
                viewModel.tapAction()
            }
        }
        .onAppear {
            viewModel.injectView()
        }
    }
}

#Preview {
    PromoView(viewModel: PromoPresenterAdapter(interactor: PromoInteractor()))
}
