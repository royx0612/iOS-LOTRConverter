//
//  CurrencyEnum.swift
//  LOTRConverter
//
//  Created by 呂騰耀 on 2025/5/26.
//

import SwiftUI

enum CurrencyEnum: String, CaseIterable, Identifiable{
    var id : CurrencyEnum { self }
    
    case copperPenny = ".copperpenny"
    case silverPenny = "silverpenny"
    case silverPiece = "silverpiece"
    case goldPenny = "goldpenny"
    case goldPiece = "goldpiece"
    case ntd1000 = "ntd1000"
    
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
        case .ntd1000:
                .ntd1000
        }
    }
    
    var rate: Double{
        switch self {
        case .copperPenny:
            25600
        case .silverPenny:
            256
        case .silverPiece:
            64
        case .goldPenny:
            14
        case .goldPiece:
            4
        case .ntd1000:
            1
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
        case .ntd1000:
            return "新台幣 1000"
        }
    }
    
    func convert(_ amount: String, to currency: CurrencyEnum) -> String {
        guard let doubleAmount = Double(amount) else {
            return ""
        }
        return String(format: "%.2f", doubleAmount / self.rate * currency.rate).replacingOccurrences(of: #"\.?0+$"#, with: "", options: .regularExpression)
    }
}
