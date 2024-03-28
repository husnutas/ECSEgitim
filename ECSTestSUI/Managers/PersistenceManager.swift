//
//  PersistenceManager.swift
//  ECSTestSUI
//
//  Created by Hüsnü Taş on 26.03.2024.
//

import Foundation

final class PersistenceManager {
    
    public static let shared = PersistenceManager()
    
    private(set) var userName = KeychainWrapper.standard.string(forKey: KeychainProperty.userName.rawValue) ?? ""
    
    private init() {}
    
    // MARK: - Keychain Methods
    func saveToKeychain(value: String, key: KeychainProperty) {
        KeychainWrapper.standard.set(value, forKey: key.rawValue)
        userName = value
    }
    
    func removeFromKeychain(key: KeychainProperty) {
        KeychainWrapper.standard.set("", forKey: key.rawValue)
    }
    
}
