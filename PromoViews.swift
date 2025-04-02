//
//  AvitoViews.swift
//  AvitoTech
//
//  Created by Mrmaks on 31.03.2025.
//

import Foundation
import SwiftUI

public var backButton: some View {
    Button(action: {
        print("Get back")
    }, label: {
        Image(systemName: "xmark")
    })
    .foregroundColor(Color.black)
    .bold()
    .padding(.trailing, 350)
    .padding(.bottom)
}

public var largeTitle: some View {
    Text("Сделайте объявление заметнее на 7 дней")
        .font(.largeTitle)
        .bold()
        .padding(.bottom, 40)
        .lineLimit(nil)
        .fixedSize(horizontal: false, vertical: true)
}

public var chooseButton: some View {
    Button("Выбрать") {
        Task {
            let data = await getPromo()
        }
    }
    .frame(width: 350, height: 56)
    .foregroundColor(Color.white)
    .background(Color.blue)
    .buttonStyle(.bordered)
    .cornerRadius(12)
}
