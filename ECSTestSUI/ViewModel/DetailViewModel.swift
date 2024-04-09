//
//  DetailViewModel.swift
//  ECSTestSUI
//
//  Created by Hüsnü Taş on 2.04.2024.
//

import Foundation

final class DetailViewModel: BaseViewModel<DetailService> {
    
    @Published var person: Person?
    
    func getUser(id: String) async {
        do {
            person = try await service.getUser(id: id)
        } catch {
            print(error.localizedDescription)
        }
    }
    
}
