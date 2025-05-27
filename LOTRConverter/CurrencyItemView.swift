//
//  CurrencyItemView.swift
//  LOTRConverter
//
//  Created by 呂騰耀 on 2025/5/26.
//
import SwiftUI

struct CurrencyItemView: View {
    var imageResource: ImageResource
    var name: String
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Image(imageResource)
                .resizable()
                .scaledToFit()
            
            Text(name)
                .padding(3)
                .font(.caption)
                .frame(maxWidth: .infinity)
                .background(.brown.opacity(0.75))
            
        }
        .frame(width: 100, height: 100)
        .padding(3)
        .background(.brown)
        .clipShape(.rect(cornerRadius: 25))
    }
}


#Preview {
    CurrencyItemView(imageResource: .copperpenny, name: "銅幣")
}
