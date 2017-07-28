//
//  SGCChainType.swift
//  Pods
//
//  Created by Tal Zion on 28/07/2017.
//
//

import Foundation

protocol SGCChainType {
    var initialHandler: SGCHandlerType? { get set }
    
    init(handlers: [SGCAbstractHandler])
}

// MARK: - Starts the Grou Chain

extension SGCChainType {
    func handel(_ type:SGCObject) {
        self.initialHandler?.handel(type)
    }
}
