//
//  Person.swift
//  ECSTestSUI
//
//  Created by Hüsnü Taş on 21.03.2024.
//

import Foundation

struct Person: Identifiable {
    let id = UUID()
    let name: String
    let lastName: String
    let age: Int
}
