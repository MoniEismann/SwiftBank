//
//  GenericSectionView.swift
//  SwiftBank
//
//  Created by Igor fe Castro Figueiredo on 24/07/24.
//

import SwiftUI

protocol GenericSectionView {
    var identifier: UUID { get set }
    func build() -> AnyView
}
