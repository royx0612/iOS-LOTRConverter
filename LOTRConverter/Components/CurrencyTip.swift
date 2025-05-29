//
//  CurrencyTip.swift
//  LOTRConverter
//
//  Created by Royx Lu on 2025/5/29.
//

import TipKit

struct CurrencyTip: Tip{
    var title: Text = Text("更改幣種")
    
    var message: Text? = Text("點選硬幣來更改幣種")

    var image: Image? = Image(systemName: "hand.tap.fill")
}
