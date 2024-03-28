//
//  UserDefault.swift
//  PaymentAppTemplate
//
//  Created by Hüsnü Taş on 25.06.2022.
//

import Foundation

@propertyWrapper
struct UserDefault<T> {
    let key: String
    let value: T

    init(key: String, default value: T) {
        self.key = key
        self.value = value
    }

    var wrappedValue: T {
        get { return UserDefaults.standard.value(forKey: key) as? T ?? self.value }
        set { UserDefaults.standard.set(newValue, forKey: key) }
    }
}
