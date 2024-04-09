//
//  MainViewModel.swift
//  ECSTestSUI
//
//  Created by Hüsnü Taş on 21.03.2024.
//

import Foundation

class MainViewModel: BaseViewModel<MainService> {
    
    @Published var people: People = []
    @Published var person: Person?
       
    // MARK: - Service Calls
    func getPeople() async {
        do {
            people = try await service.getPeople()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func getPerson(id: String) async {
        do {
            person = try await service.getPerson(id: id)
        } catch {
            print(error.localizedDescription)
        }
    }
    
}
