//
//  URLExtension.swift
//  SwiftBank
//
//  Created by Igor fe Castro Figueiredo on 29/07/24.
//

import Foundation

extension URL {
    public var queryParameters: [String: String]? {
        guard let components = URLComponents(url: self, resolvingAgainstBaseURL: true),
              let queryItems = components.queryItems else { return nil}
        
        return queryItems.reduce(into: [String: String]()) { (result, item) in
            result[item.name] = item.value?.replacingOccurrences(of: "+", with: " ")
        }
    }
}
