
//
//  ExtractedView.swift
//  LOTRConverter
//
//  Created by Royx Lu on 2025/5/26.
//

import SwiftUI

struct ExchangeRate: View {
    
    let leftImage: ImageResource
    let rightImage: ImageResource
    let text: String
    
    var body: some View {
        HStack{
            // left image
            Image(leftImage)
                .resizable()
                .scaledToFit()
                .frame(width: 30)
            
            // description
            Text(text)
            
            // right image
            Image(rightImage)
                .resizable()
                .scaledToFit()
                .frame(width: 30)
        }
    }
}

#Preview {
    ExchangeRate(leftImage: .goldpiece, rightImage: .goldpenny, text: "1 金幣 = 4 分錢")
}
