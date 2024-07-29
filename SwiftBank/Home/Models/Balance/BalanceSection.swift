//
//  BalanceSection.swift
//  SwiftBank
//
//  Created by Igor fe Castro Figueiredo on 24/07/24.
//

import SwiftUI

struct BalanceSection: GenericSectionView {
    
    var identifier = UUID()
    var model: BalanceResponse
    
    func build() -> AnyView {
        return AnyView(BalanceView(balanceResponse: model))
    }
}
