//
//  CurrencyComponentView.swift
//  LOTRConverter
//
//  Created by Royx Lu on 2025/5/29.
//

import SwiftUI
import TipKit

struct CurrencyComponentView: View {
    
    @Binding var amount: String
    @Binding var currency: CurrencyEnum
    @Binding var showSelectCurrent: Bool
    var focusState: FocusState<Bool>.Binding
    
    let currencyTip = CurrencyTip()
    
    var body: some View {
        VStack{
            // currency
            HStack{
                // currency image
                Image(currency.image)
                    .resizable()
                    .scaledToFit()
                    .frame(height:30)
                
                //currency text
                Text(currency.name)
                    .font(.headline)
                    .foregroundStyle(.white)
            }
            .onTapGesture {
                showSelectCurrent = true
            }
            .popoverTip(currencyTip, arrowEdge: .bottom)
            
            
            TextField("輸入", text: $amount)
                .textFieldStyle(.roundedBorder)
                .padding(.top, -5)
                .focused(focusState)
                .keyboardType(.decimalPad)
        }
        .task {
            try? Tips.configure()
        }
    }
}

#Preview {
    @Previewable @State var amount: String = ""
    @Previewable @State var currency: CurrencyEnum = .copperPenny
    @Previewable @State var showSelectCurrent: Bool = false
    @Previewable @FocusState var focusState: Bool
    
    CurrencyComponentView(amount: $amount, currency: $currency, showSelectCurrent: $showSelectCurrent, focusState: $focusState)
}
