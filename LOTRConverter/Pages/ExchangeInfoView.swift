//
//  ExchangeInfo.swift
//  LOTRConverter
//
//  Created by Royx Lu on 2025/5/26.
//

import SwiftUI

struct ExchangeInfoView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack{
            // background
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
        
            // main
            VStack{
                // title
                Text("兌換資訊")
                    .font(.largeTitle)
                    .tracking(3)
                    
                // description
                Text("在躍馬酒店，我們很高興為您提供一個可以兌換全世界所有已知貨幣的地方，除了一種貨幣。我們過去曾接受白蘭地雄鹿幣（BrandyBucks），但在發現那是一個人的名字而不是紙幣後，我們意識到它對我們沒有價值。以下是我們貨幣兌換匯率的簡單指南：")
                    .font(.title3)
                    .padding()
                
                // detail
                ExchangeRate(leftImage: .goldpiece, rightImage: .goldpenny, text: "1 金幣 = 4 金分")
                
                ExchangeRate(leftImage: .goldpenny, rightImage: .silverpiece, text: "1 金分 = 4 銀幣")

                ExchangeRate(leftImage: .silverpiece, rightImage: .silverpenny, text: "1 銀幣 = 4 銀分")

                ExchangeRate(leftImage: .silverpenny, rightImage: .copperpenny, text: "1 銀分 = 100 銅錢")
                
                // button
                Button("了解") {
                    dismiss()
                }
                .padding()
                .buttonStyle(.borderedProminent)
                .font(.largeTitle)
                .tint(.brown)
                .foregroundStyle(.white)
            }
            .foregroundStyle(.black)
        }
    }
}

#Preview {
    ExchangeInfoView()
}
