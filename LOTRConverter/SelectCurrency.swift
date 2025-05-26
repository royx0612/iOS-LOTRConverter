//
//  SelectCurrency.swift
//  LOTRConverter
//
//  Created by Royx Lu on 2025/5/26.
//

import SwiftUI

struct SelectCurrency: View {
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
                
                // icons
                LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]){
                    ForEach(CurrencyEnum.allCases){ currency in
                        CurrencyItemView(imageResource: currency.image, name: currency.name)
                    }
                }

                
                // text
                Text("請輸入要目的貨幣")
                    .foregroundStyle(.black)
                
                // icons
                
                // button
                
            }
            .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    SelectCurrency()
}


