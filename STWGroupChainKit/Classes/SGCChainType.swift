//
//  SGCChainType.swift
//  Pods
//
//  Created by Tal Zion on 28/07/2017.
//
//

import Foundation

public protocol SGCChainType {
    var initialHandler: SGCHandlerType? { get set }
    
    init(handlers: [SGCAbstractHandler])
    func handel(_ type:SGCObject)
}

// MARK: - Starts the Grou Chain

extension SGCChainType {
    public func handel(_ type:SGCObject) {
        self.initialHandler?.handel(type)
    }
}
