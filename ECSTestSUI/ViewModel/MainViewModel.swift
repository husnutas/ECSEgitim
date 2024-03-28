//
//  MainViewModel.swift
//  ECSTestSUI
//
//  Created by Hüsnü Taş on 21.03.2024.
//

import Foundation

class MainViewModel: ObservableObject {
    
    @Published var people: People = []
    @Published var person: Person?
    
    let apiManager = APIManager()
    
    func getPeople() async {
        do {
            people = try await apiManager.fetchData(urlString: "https://userlistapi.netlify.app/api/users")
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func getPerson(id: String) async {
        do {
            person = try await apiManager.fetchData(urlString: "https://userlistapi.netlify.app/api/users/\(id)")
        } catch {
            print(error.localizedDescription)
        }
    }
    
}
