//
//  SGCAbstractHandler.swift
//  Pods
//
//  Created by Tal Zion on 28/07/2017.
//
//

import Foundation

open class AbstractHandler: NSObject, HandlerType {
    
    open var successor: HandlerType?
    open var id: String {
        return String(describing: self)
    }
    
    open func execute(object: ChainElement) {
        fatalError("You must overrride me!!!@")
    }
    
    open static func ==(lhs: AbstractHandler, rhs: AbstractHandler) -> Bool {
        return lhs.id == rhs.id
    }
}
