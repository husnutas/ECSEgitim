//
//  Person.swift
//  ECSTestSUI
//
//  Created by Hüsnü Taş on 21.03.2024.
//

import Foundation

// MARK: - Person
struct Person: Codable, Identifiable {
    let id: String
    let avatarURL, name, bio: String
    let isChecked: Bool

    enum CodingKeys: String, CodingKey {
        case id
        case avatarURL = "avatarUrl"
        case name, bio, isChecked
    }
}

typealias People = [Person]
