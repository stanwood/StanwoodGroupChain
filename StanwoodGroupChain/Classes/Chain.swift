//
//  Chain.swift
//  Pods
//
//  Created by Tal Zion on 27/09/2017.
//

import Foundation

open class Chain: ChainType {
    
    public var initialHandler: HandlerType?
    
    public required init(handlers: [AbstractHandler]) {
        
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
