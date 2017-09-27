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
        
        let count = handlers.count
        
        handlers.forEach { (handler) in
            guard let firstIndex = handlers.index(of: handler), firstIndex != 0 else { return }
            
            guard handlers.last == handler else { return }
            
            if let s = handlers.index(of: handler) {
                
            }
        }
    }
}
