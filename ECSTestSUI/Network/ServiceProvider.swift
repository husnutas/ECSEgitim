//
//  ServiceProvider.swift
//  ECSTestSUI
//
//  Created by Hüsnü Taş on 4.04.2024.
//

import Foundation

final class ServiceProvider {
    
    private let baseUrl = "https://userlistapi.netlify.app/api/"
    
    func getFullUrl(endpoint: Endpoint) -> String {
        baseUrl + endpoint.rawValue
    }
    
}
