//
//  GenericSection.swift
//  SwiftBank
//
//  Created by Igor fe Castro Figueiredo on 25/07/24.
//

import SwiftUI

struct GenericSection: GenericSectionView {
    
    var identifier = UUID()
    var model: GenericSectionResponse
    
    func build() -> AnyView {
        return AnyView(GenericView(genericResponse: model))
    }
}
