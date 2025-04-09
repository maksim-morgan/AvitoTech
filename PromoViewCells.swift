//
//  PromoViewCells.swift
//  AvitoTech
//
//  Created by Mrmaks on 09.04.2025.
//

import Foundation
import SwiftUI
// Сделайте объявление заметнее на 7 дней
struct LargeTitleView: View {
    let title: String

    var body: some View {
        Text(title)
            .font(.largeTitle)
            .bold()
            .padding(.bottom, 40)
            .lineLimit(nil)
            .fixedSize(horizontal: false, vertical: true)
    }
}
// Кнопка выбора
struct SelectedActionButton: View {
    let title: String
    let action: () -> Void

    var body: some View {
        Button(title) {
            action()
        }
        .frame(width: 350, height: 56)
        .foregroundColor(.white)
        .background(Color.blue)
        .buttonStyle(.bordered)
        .cornerRadius(12)
    }
}
// Кнопка крестика
struct BackButtonView: View {
    let action: () -> Void

    var body: some View {
        Button(action: {
            action()
        }) {
            Image(systemName: "xmark")
                .foregroundColor(.black)
                .bold()
        }
        .padding(.trailing, 350)
        .padding(.bottom)
    }
}
// Два стека с текстом и картинкой
struct AdvertisingView: View {
    let list: [PromoList]?
    let selectedIndex: Int?
    let onSelect: (Int) -> Void

    var body: some View {
        VStack(spacing: 16) {
            if let item0 = list?[0] {
                HStack {
                    AsyncImage(url: URL(string: item0.icon.the52x52)) { image in
                        image.resizable().scaledToFill()
                    } placeholder: {
                        Color.gray.opacity(0.2)
                    }
                    .frame(width: 56, height: 56)
                    .clipShape(RoundedRectangle(cornerRadius: 8))

                    VStack(alignment: .leading, spacing: 4) {
                        Text(item0.title)
                            .font(.headline).bold()

                        Text(item0.description ?? "")
                            .font(.system(size: 16))
                            .foregroundColor(.gray)

                        Text(item0.price)
                            .font(.headline).bold()
                    }

                    Spacer()

                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.blue)
                        .opacity(selectedIndex == 0 ? 1 : 0)
                }
                .padding()
                .frame(width: 380, height: 190)
                .background(selectedIndex == 0 ? Color.blue.opacity(0.2) : Color(.systemGray5))
                .cornerRadius(12)
                .onTapGesture {
                    onSelect(0)
                }
            }

            if let item1 = list?[1] {
                HStack {
                    AsyncImage(url: URL(string: item1.icon.the52x52)) { image in
                        image.resizable().scaledToFill()
                    } placeholder: {
                        Color.gray.opacity(0.2)
                    }
                    .frame(width: 56, height: 56)
                    .clipShape(RoundedRectangle(cornerRadius: 8))

                    VStack(alignment: .leading, spacing: 4) {
                        Text(item1.title)
                            .font(.headline).bold()

                        Text(item1.description ?? "")
                            .font(.system(size: 16))
                            .foregroundColor(.gray)

                        Text(item1.price)
                            .font(.headline).bold()
                    }

                    Spacer()

                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.blue)
                        .opacity(selectedIndex == 1 ? 1 : 0)
                }
                .padding()
                .frame(width: 380, height: 190)
                .background(selectedIndex == 1 ? Color.blue.opacity(0.2) : Color(.systemGray5))
                .cornerRadius(12)
                .onTapGesture {
                    onSelect(1)
                }
            }
        }
    }
}
