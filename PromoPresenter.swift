//
//  ContentView.swift
//  AvitoTech
//
//  Created by Mrmaks on 31.03.2025.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedPromo: String? = nil
    let promos = PromoData.promos
    
    var body: some View {
        VStack {
            VStack {
                backButton
                largeTitle
                advertisingView
            }
            .padding(.bottom, 150)
            
            chooseButton
        }
        .padding()
    }
    
    private func toggleSection(for id: String) {
        selectedPromo = (selectedPromo == id) ? nil : id
    }
    
    var advertisingView: some View {
        ForEach(promos, id: \.id) { promo in
            Button {
                toggleSection(for: promo.id)
            } label: {
                HStack {
                    Circle()
                        .fill(promo.color)
                        .frame(width: 56, height: 56)
                        .padding(.trailing, 0)

                    VStack(alignment: .leading, spacing: 4) {
                        Text(promo.title)
                            .font(.headline)
                            .bold()

                        Text(promo.description)
                            .font(.system(size: 16))
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.leading)
                            .lineLimit(nil)
                         

                        Text(promo.price)
                            .font(.headline)
                            .bold()
                    }

                    
                    Spacer()
                    
                    if selectedPromo == promo.id {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.blue)
                            .padding(.trailing)
                    }
                }
                .padding()
                .frame(width: 380, height: 190) // Занимает всю ширину
                .background(Color(.systemGray5))
                .cornerRadius(12)
                .onTapGesture {
                    toggleSection(for: promo.id)
                }
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    ContentView()
}
