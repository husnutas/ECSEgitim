//
//  MainService.swift
//  ECSTestSUI
//
//  Created by Hüsnü Taş on 2.04.2024.
//

import Foundation

final class MainService: BaseService {
    
    func getPeople() async throws -> People {
        do {
            return try await apiManager.fetchData(endpoint: .users, method: .get)
        } catch {
            throw error
        }
    }
    
    func getPerson(id: String) async throws -> Person {
        do {
            return try await apiManager.fetchData(endpoint: .users, method: .get, path: id)
        } catch {
            throw error
        }
    }
    
}
