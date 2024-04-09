//
//  APIManager.swift
//  ECSTestSUI
//
//  Created by Hüsnü Taş on 28.03.2024.
//

import Foundation

final class APIManager {
    
    private let serviceProvider = ServiceProvider()
    
    func fetchData<T: Codable, B: Codable>(endpoint: Endpoint, method: HttpMethod, body: B = EmptyBody(), path: String? = nil) async throws -> T {
        let urlString = serviceProvider.getFullUrl(endpoint: endpoint)
        
        var url = URL(string: urlString)
        
        if let path {
            url?.append(path: path)
        }
        
        guard let url else { throw CustomError.invalidUrl }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            if !(body is EmptyBody) {
                urlRequest.httpBody = try JSONEncoder().encode(body)
            }
            
            let (data, _) = try await URLSession.shared.data(for: urlRequest)
            
//            print(String(data: data, encoding: .utf8))
            
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw error
        }
    }
    
}
