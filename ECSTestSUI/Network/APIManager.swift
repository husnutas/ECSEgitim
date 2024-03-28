//
//  APIManager.swift
//  ECSTestSUI
//
//  Created by Hüsnü Taş on 28.03.2024.
//

import Foundation

final class APIManager {
    
    func fetchData<T: Codable>(urlString: String) async throws -> T {
        guard let url = URL(string: urlString) else { throw CustomError.invalidUrl }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
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
