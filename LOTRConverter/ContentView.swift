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
    @State var leftAmount: String = ""
    
    // right amount
    @State var rightAmount: String = ""
    
    @State var leftCurrency:CurrencyEnum = .silverPiece
    
    @State var rightCurrency:CurrencyEnum = .goldPiece
    
    
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
                    VStack{
                        // currency
                        HStack{
                            // currency image
                            Image(leftCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width:30)
                            
                            //currency text
                            Text(leftCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                        }
                        .onTapGesture {
                            showSelectCurrent = true
                        }
                        
                        TextField("銀幣輸入", text: $leftAmount)
                            .textFieldStyle(.roundedBorder)
                            .padding(.top, -5)
                    }
                    
                    // equal sign
                    Image(systemName: "equal")
                        .foregroundStyle(.white)
                        .font(.largeTitle)
                        .symbolEffect(.pulse)
                    
                    // righr conversion
                    VStack{
                        // currency
                        HStack{
                            // currency image
                            Image(rightCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width:30)
                            
                            //currency text
                            Text(rightCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                        }
                        .onTapGesture {
                            showSelectCurrent = true
                        }
                        
                        TextField("金幣兌換結果", text: $rightAmount)
                            .textFieldStyle(.roundedBorder)
                            .multilineTextAlignment(.trailing)
                            .padding(.top, -5)
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
            .sheet(isPresented: $showExchangeInfo){
                ExchangeInfoView()
            }
            .sheet(isPresented: $showSelectCurrent){
                SelectCurrencyView(sourceCurrency: $leftCurrency, targetCurrency: $rightCurrency)
            }
//            .border(.blue)
        }
    }
}

#Preview {
    ContentView()
}
