//
//  AddPersonViewModel.swift
//  ECSTestSUI
//
//  Created by Hüsnü Taş on 26.03.2024.
//

import Foundation

@MainActor
final class AddPersonViewModel: ObservableObject {
    
    private let persistenceManager = PersistenceManager.shared
    private let apiManager = APIManager()
    
    var person: Person?
    
    func saveToDevice(value: String, key: KeychainProperty) {
        persistenceManager.saveToKeychain(value: value, key: key)
    }
    
    func addPerson(_ person: Person) async {
        do {
            self.person = try await apiManager.fetchData(urlString: "https://userlistapi.netlify.app/api/users", method: .post, body: person)
        } catch {
            print(error.localizedDescription)
        }
    }
    
}
