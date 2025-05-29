//
//  SelectCurrency.swift
//  LOTRConverter
//
//  Created by Royx Lu on 2025/5/26.
//

import SwiftUI

struct SelectCurrencyView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var sourceCurrency: CurrencyEnum
    @Binding var targetCurrency: CurrencyEnum
    
    var body: some View {
        ZStack{
            // background
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            
            VStack{
                // text
                Text("請選擇要來源貨幣")
                    .foregroundStyle(.black)
                    .bold()
                    .padding()
                
                // icons
                CurrencyStackView(selectedCurrency: $sourceCurrency)

                // text
                Text("請輸入要目的貨幣")
                    .foregroundStyle(.black)
                    .bold()
                    .padding()
                
                // icons
                CurrencyStackView(selectedCurrency: $targetCurrency)
                
                // button
                Button("完成"){
                    dismiss()
                }
                .padding()
                .buttonStyle(.borderedProminent)
                .font(.largeTitle)
                .tint(.brown)
                .foregroundStyle(.white)
                
                
            }
            .multilineTextAlignment(.center)
            .padding()
        }
    }
}

#Preview {
    @Previewable @State var sourceCurrency: CurrencyEnum = .copperPenny
    @Previewable @State var targetCurrency: CurrencyEnum = .goldPiece
    
    SelectCurrencyView(sourceCurrency: $sourceCurrency, targetCurrency: $targetCurrency)
}



