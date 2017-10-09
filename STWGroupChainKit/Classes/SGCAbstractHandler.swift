//
//  SGCAbstractHandler.swift
//  Pods
//
//  Created by Tal Zion on 28/07/2017.
//
//

import Foundation

open class SGCAbstractHandler: NSObject, SGCHandlerType {
    
    open var successor: SGCHandlerType?
    open var id: String {
        return String(describing: self)
    }
    
    open func execute(object: SGCObject) {
        fatalError("You must overrride me!!!@")
    }
    
    open static func ==(lhs: SGCAbstractHandler, rhs: SGCAbstractHandler) -> Bool {
        return lhs.id == rhs.id
    }
}
