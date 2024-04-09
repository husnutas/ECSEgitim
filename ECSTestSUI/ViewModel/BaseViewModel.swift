//
//  BaseViewModel.swift
//  ECSTestSUI
//
//  Created by Hüsnü Taş on 2.04.2024.
//

import Foundation

@MainActor
class BaseViewModel<S: BaseService>: ObservableObject {
        
    let service: S
    
    init(service: S) {
        self.service = service
    }
    
}
