//
//  DetailViewModel.swift
//  ECSTestSUI
//
//  Created by Hüsnü Taş on 26.03.2024.
//

import Foundation

final class DetailViewModel: ObservableObject {
    
    private let persistenceManager = PersistenceManager.shared
    
    func saveToDevice(value: String, key: KeychainProperty) {
        persistenceManager.saveToKeychain(value: value, key: key)
    }
    
}
