//
//  ChainType.swift
//  Pods
//
//  Created by Tal Zion on 28/07/2017.
//
//

import Foundation

public protocol ChainType {
    var initialHandler: HandlerType? { get set }
    
    init(handlers: [AbstractHandler])
    func handel(_ type:ChainElement)
}

// MARK: - Starts the Grou Chain

extension ChainType {
    public func handel(_ type:ChainElement) {
        self.initialHandler?.handel(type)
    }
}
