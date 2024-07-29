//
//  NavigationRounter.swift
//  SwiftBank
//
//  Created by Igor fe Castro Figueiredo on 26/07/24.
//

import Foundation

final class NavigationRouter: ObservableObject {
    
    // MARK: - Attributes
    
    @Published var router = [Route]()
    
    static let shared = NavigationRouter()
    
    private init() { }
    
    // MARK: - Class methods
    
    func push(to screen: Route) {
        guard !router.contains(screen) else {
            return
        }
        router.append(screen)
    }
}
