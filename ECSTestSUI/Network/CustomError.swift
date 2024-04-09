//
//  CustomError.swift
//  ECSTestSUI
//
//  Created by Hüsnü Taş on 4.04.2024.
//

import Foundation

enum CustomError: Error {
    case invalidUrl
    
    var description: String {
        switch self {
        case .invalidUrl:
            "Invalid URL!"
        }
    }
}
