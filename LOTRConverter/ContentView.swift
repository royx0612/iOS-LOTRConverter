//
//  ContentView.swift
//  LOTRConverter
//
//  Created by Royx Lu on 2025/5/26.
//

import SwiftUI

struct ContentView: View {
    // Info switcher
    @State var showExchangeInfo:Bool = false
    @State var showSelectCurrent:Bool = false
    // rate
    @State var goldToSliverRate: Double = 5.0
    
    // left amount
    @AppStorage("leftAmount") var leftAmount: String = ""
    
    // right amount
    @AppStorage("rightAmount") var rightAmount: String = ""
    
    @AppStorage("leftCurreny") var leftCurrency:CurrencyEnum = .copperPenny
    
    @AppStorage("rightCurreny") var rightCurrency:CurrencyEnum = .goldPiece
    
    @FocusState var leftFocusState: Bool
    @FocusState var rightFocusState: Bool
    
    let currencyTip = CurrencyTip()
    
    var body: some View {
        ZStack{
            // Background Image
            Image(.background)
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                // Image
                Image(.prancingpony)
                    .resizable()
                    .scaledToFit()
                    .frame(height:200)
                
                // Label
                Text("貨幣兌換")
                    .font(.largeTitle)
                    .foregroundStyle(.white)

                // HStack
                HStack{
                    // left conversion
                    CurrencyComponentView(amount: $leftAmount, currency: $leftCurrency, showSelectCurrent: $showSelectCurrent, focusState: $leftFocusState)
                    
                    // equal sign
                    Image(systemName: "equal")
                        .foregroundStyle(.white)
                        .font(.largeTitle)
                        .symbolEffect(.pulse)
                    
                    // righr conversion
                    VStack{
                        // currency
                        CurrencyComponentView(amount: $rightAmount, currency: $rightCurrency, showSelectCurrent: $showSelectCurrent, focusState: $rightFocusState)
                    }
                }
                .padding()
                .background(.black.opacity(0.5))
                .clipShape(.capsule)

                
                Spacer()
                        
                // Info Button
                HStack {
                    Spacer()
                    Button {
                        showExchangeInfo = true;
                    } label: {
                        Image(systemName: "info.circle.fill")
                            .foregroundStyle(.white)
                            .font(.largeTitle)
                            .padding(.trailing)
                    }
                }
            }
            .onChange(of: leftCurrency){
                leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency)
            }
            .onChange(of: rightCurrency){
                rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency)
            }
            .onChange(of: leftAmount){
                if leftFocusState{
                    rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency)
                }
            }
            .onChange(of: rightAmount){
                if rightFocusState{
                    leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency)
                }
            }
            .sheet(isPresented: $showExchangeInfo){
                ExchangeInfoView()
            }
            .sheet(isPresented: $showSelectCurrent){
                SelectCurrencyView(sourceCurrency: $leftCurrency, targetCurrency: $rightCurrency)
            }
//            .border(.blue)
        }
        .onTapGesture{
            print("Close Foucus")
            leftFocusState = false
            rightFocusState = false
        }
    }
}

#Preview {
    ContentView()
}

