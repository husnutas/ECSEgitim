//
//  AppUserDefaults.swift
//  PaymentAppTemplate
//
//  Created by Hüsnü Taş on 25.06.2022.
//

import Foundation

struct AppUserDefaults {
    @UserDefault(key: UserDefaultsKey.authToken.rawValue, default: "")
    static var authToken: String {
        didSet {
//            AuthManager.shared.isRegistered = !authToken.isEmpty
        }
    }
    
    @UserDefault(key: UserDefaultsKey.msisdn.rawValue, default: "")
    static var msisdn: String
    
    @UserDefault(key: UserDefaultsKey.userName.rawValue, default: "")
    static var userName: String
    
    @UserDefault(key: UserDefaultsKey.isGreetingCompleted.rawValue, default: false)
    static var isGreetingCompleted: Bool
    
    @UserDefault(key: UserDefaultsKey.faceIdPermission.rawValue, default: false)
    static var faceIdPermission: Bool
    @UserDefault(key: UserDefaultsKey.notificationPermision.rawValue, default: false)
    static var notificationPermision: Bool
}
