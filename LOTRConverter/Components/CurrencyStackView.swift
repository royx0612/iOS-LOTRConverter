//
//  CurrencyStackView.swift
//  LOTRConverter
//
//  Created by Royx Lu on 2025/5/27.
//

import SwiftUI

struct CurrencyStackView: View {
    @Binding var selectedCurrency:CurrencyEnum
    
    var body: some View {
        LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]){
            ForEach(CurrencyEnum.allCases){ currency in
                if(selectedCurrency == currency){
                    CurrencyItemView(imageResource: currency.image, name: currency.name)
                        .shadow(color:.black ,radius: 10)
                        .overlay {
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(lineWidth:2)
                                .fill(.black)
                                .opacity(0.5)
                        }
                }else{
                    CurrencyItemView(imageResource: currency.image, name: currency.name)
                        .onTapGesture {
                            self.selectedCurrency = currency
                        }
                }
                
            }
        }
    }
}


#Preview {
    @Previewable @State var selectedCurrency:CurrencyEnum = .copperPenny
    CurrencyStackView(selectedCurrency: $selectedCurrency)
}
