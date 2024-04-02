//
//  APIManager.swift
//  ECSTestSUI
//
//  Created by Hüsnü Taş on 28.03.2024.
//

import Foundation

final class APIManager {
    
    func fetchData<T: Codable, B: Codable>(urlString: String, method: HttpMethod, body: B = EmptyBody(), path: String? = nil) async throws -> T {
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

enum CustomError: Error {
    case invalidUrl
    
    var description: String {
        switch self {
        case .invalidUrl:
            "Invalid URL!"
        }
    }
}

enum HttpMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}
