//
//  AddPersonService.swift
//  ECSTestSUI
//
//  Created by Hüsnü Taş on 4.04.2024.
//

import Foundation

final class AddPersonService: BaseService {
    
    func addPerson(_ person: Person) async throws -> Person {
        do {
            return try await apiManager.fetchData(endpoint: .users, method: .post, body: person)
        } catch {
            throw error
        }
    }
    
}
