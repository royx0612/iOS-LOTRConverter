//
//  CurrencyEnum.swift
//  LOTRConverter
//
//  Created by 呂騰耀 on 2025/5/26.
//

import SwiftUI

enum CurrencyEnum: Int, CaseIterable, Identifiable{
    var id : CurrencyEnum { self }
    
    case copperPenny = 6400
    case silverPenny = 64
    case silverPiece = 16
    case goldPenny = 4
    case goldPiece = 1
    
    var image: ImageResource{
        switch self {
        case .copperPenny:
                .copperpenny
        case .silverPenny:
                .silverpenny
        case .silverPiece:
                .silverpiece
        case .goldPenny:
                .goldpenny
        case .goldPiece:
                .goldpiece
        }
    }
    
    var name: String{
        switch self {
        case .copperPenny:
            return "銅錢"
        case .silverPenny:
            return "銀錢"
        case .silverPiece:
            return "銀幣"
        case .goldPenny:
            return "金錢"
        case .goldPiece:
            return "金幣"
        }
    }
}
