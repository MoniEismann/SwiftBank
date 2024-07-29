//
//  GenericSectionResponse.swift
//  SwiftBank
//
//  Created by Igor fe Castro Figueiredo on 25/07/24.
//

import Foundation

struct GenericSectionResponse: Decodable {
    
    // MARK: - Attributes
    
    private(set) var title: TextModel
    private(set) var subtitle: TextModel
}
