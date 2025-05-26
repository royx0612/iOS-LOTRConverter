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
                    .bold()
                
                // icons
                ZStack(alignment: .bottom) {
                    Image(.copperpenny)
                        .resizable()
                        .scaledToFit()
                    
                    Text("銅幣")
                        .padding(3)
                        .font(.caption)
                        .frame(maxWidth: .infinity)
                        .background(.brown.opacity(0.75))
                    
                }
                .frame(width: 100, height: 100)
                .padding(3)
                .background(.brown)
                .clipShape(.rect(cornerRadius: 20))
                
                
                
                
                // text
                Text("請輸入要目的貨幣")
                
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
