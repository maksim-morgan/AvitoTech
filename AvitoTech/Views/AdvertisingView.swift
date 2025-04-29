//
//  PromoViewCells.swift
//  AvitoTech
//
//  Created by Mrmaks on 09.04.2025.
//

import Foundation
import SwiftUI

struct AdvertisingView: View {
    let list: [PromoList]?
    let selectedIndex: Int?
    let onSelect: (Int) -> Void
    
    var body: some View {
        VStack(spacing: 16) {
            if let list = list {
                ForEach([0, 1], id: \.self) { index in
                        let item = list[index]
                        HStack {
                            AsyncImage(url: URL(string: item.icon.the52x52)) { image in
                                image.resizable().scaledToFill()
                            } placeholder: {
                                Color.gray.opacity(0.2)
                            }
                            .frame(width: 56, height: 56)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text(item.title)
                                    .font(.headline).bold()
                                
                                Text(item.description ?? "")
                                    .font(.system(size: 16))
                                    .foregroundColor(.gray)
                                
                                Text(item.price)
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
                }
            }
        }
    }
    
    extension AdvertisingView {
        enum Constants {
            static let thirtyTwo: CGFloat = 32
            static let zero: CGFloat = 0
            static let zeroTwo: CGFloat = 0.2
            static let fiftySix: CGFloat = 56
            static let four: CGFloat = 4
            static let eight: CGFloat = 8
            static let twelve: CGFloat = 12
            static let sixteen: CGFloat = 16
            static let hstackWidth: CGFloat = 380
            static let hstackHeight: CGFloat = 190
        }
    }
