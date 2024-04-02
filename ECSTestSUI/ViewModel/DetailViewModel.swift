//
//  DetailViewModel.swift
//  ECSTestSUI
//
//  Created by Hüsnü Taş on 2.04.2024.
//

import Foundation

final class DetailViewModel: ObservableObject {
    
    private let apiManager = APIManager()
    
    @Published var person: Person?
    
    func getUser(id: String) async {
        do {
            person = try await apiManager.fetchData(urlString: "https://userlistapi.netlify.app/api/users", method: .get, path: id)
        } catch {
            print(error.localizedDescription)
        }
    }
    
}
