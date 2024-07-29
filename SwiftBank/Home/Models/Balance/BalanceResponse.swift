//
//  BalanceResponse.swift
//  SwiftBank
//
//  Created by Igor fe Castro Figueiredo on 24/07/24.
//

import Foundation

struct BalanceResponse: Decodable {
    
    private(set) var amount: Amount
    private(set) var items: [BalanceItem]
    
    struct Amount: Decodable {
        private enum CodingKeys: String, CodingKey {
            case currencySymbol = "currency_symbol"
            case value
        }
        
        private(set) var currencySymbol: String
        private(set) var value: TextModel
    }
    
    struct BalanceItem: Decodable {
        private(set) var id: String
        private(set) var title: TextModel
        private(set) var icon: String
        private(set) var deeplink: String?
    }
}

