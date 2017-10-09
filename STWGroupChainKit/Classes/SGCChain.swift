//
//  SGCChain.swift
//  Pods-STWGroupChainKit_Example
//
//  Created by Tal Zion on 27/09/2017.
//

import Foundation

open class SGCChain: SGCChainType {
    
    public var initialHandler: SGCHandlerType?
    
    public required init(handlers: [SGCAbstractHandler]) {
        
        initialHandler = handlers.first
        
        for (index, handler) in handlers.enumerated() {
            guard index != handlers.startIndex else { continue }
            
            if index == 1 {
                initialHandler?.set(handler)
                continue
            }
            
            let predecessor = handlers[index - 1]
            predecessor.set(handler)
        }
    }
}
