//
//  DetailService.swift
//  ECSTestSUI
//
//  Created by Hüsnü Taş on 4.04.2024.
//

import Foundation

final class DetailService: BaseService {
    
    func getUser(id: String) async throws -> Person {
        do {
            return try await apiManager.fetchData(endpoint: .users, method: .get, path: id)
        } catch {
            throw error
        }
    }
    
}
