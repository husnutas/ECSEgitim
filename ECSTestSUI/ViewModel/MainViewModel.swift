//
//  MainViewModel.swift
//  ECSTestSUI
//
//  Created by Hüsnü Taş on 21.03.2024.
//

import Foundation

@MainActor
class MainViewModel: ObservableObject {
    
    @Published var people: People = []
    @Published var person: Person?
    
    private let apiManager = APIManager()
    
    func getPeople() async {
        do {
            people = try await apiManager.fetchData(urlString: "https://userlistapi.netlify.app/api/users", method: .get)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func getPerson(id: String) async {
        do {
            person = try await apiManager.fetchData(urlString: "https://userlistapi.netlify.app/api/users/\(id)", method: .get)
        } catch {
            print(error.localizedDescription)
        }
    }
    
}
