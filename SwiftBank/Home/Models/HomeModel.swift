//
//  HomeModel.swift
//  SwiftBank
//
//  Created by Igor fe Castro Figueiredo on 23/07/24.
//

import Foundation

class HomeModel: NSObject, Decodable {
    
    private(set) var header: Header
    private(set) var items: [SectionModel]?
    
    struct Header: Decodable {
        var title: TextModel
    }
}
