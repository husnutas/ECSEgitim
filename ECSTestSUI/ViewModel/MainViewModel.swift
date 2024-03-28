//
//  MainViewModel.swift
//  ECSTestSUI
//
//  Created by Hüsnü Taş on 21.03.2024.
//

import Foundation

class MainViewModel: ObservableObject {
    
    @Published var people: [Person] = []
    
    func fetchData() {
        people = [
            Person(name: "Ali", lastName: "Ayaz", age: 20),
            Person(name: "Ahmet", lastName: "ASD", age: 12),
            Person(name: "dsad", lastName: "ASD", age: 12),
            Person(name: "asd", lastName: "ASD", age: 12),
            Person(name: "fsfczx", lastName: "ASD", age: 12)
        ]
    }
    
}
