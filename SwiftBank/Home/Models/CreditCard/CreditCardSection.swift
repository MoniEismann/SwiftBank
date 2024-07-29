//
//  CreditCardSection.swift
//  SwiftBank
//
//  Created by Igor fe Castro Figueiredo on 25/07/24.
//

import SwiftUI

struct CreditCardSection: GenericSectionView {
    
    var identifier = UUID()
    var model: CreditCardResponse
    
    func build() -> AnyView {
        return AnyView(CreditCardView(creditCardResponse: model))
    }
}
