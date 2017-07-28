//
//  SGCAbstractHandler.swift
//  Pods
//
//  Created by Tal Zion on 28/07/2017.
//
//

import Foundation

class SGCAbstractHandler: NSObject, SGCHandlerType {
    
    var successor: SGCHandlerType?
    var id: String {
        return String(describing: self)
    }
    
    func execute(object: SGCObject) {
        fatalError("You must overrride me!!!@")
    }
    
    static func ==(lhs: SGCAbstractHandler, rhs: SGCAbstractHandler) -> Bool {
        return lhs.id == rhs.id
    }
}
