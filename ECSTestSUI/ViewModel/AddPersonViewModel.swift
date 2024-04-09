//
//  AddPersonViewModel.swift
//  ECSTestSUI
//
//  Created by Hüsnü Taş on 26.03.2024.
//

import Foundation

final class AddPersonViewModel: BaseViewModel<AddPersonService> {
    
    private let persistenceManager = PersistenceManager.shared
    
    var person: Person?
    
    // MARK: - Service Calls
    func addPerson(_ person: Person) async {
        do {
            self.person = try await service.addPerson(person)
        } catch {
            print(error.localizedDescription)
        }
    }
    
}

extension AddPersonViewModel {
    func saveToDevice(value: String, key: KeychainProperty) {
        persistenceManager.saveToKeychain(value: value, key: key)
    }
}
