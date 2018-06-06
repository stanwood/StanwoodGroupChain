//
//  SGCAbstractHandler.swift
//  Pods
//
//  Created by Tal Zion on 28/07/2017.
//  Copyright (c) 2018 Stanwood GmbH. All rights reserved.
//

import Foundation

open class AbstractHandler: NSObject, HandlerType {
    
    open var successor: HandlerType?
    open var id: String {
        return String(describing: self)
    }
    
    open func execute(_ element: ChainElement) {
        fatalError("You must overrride me!!!@")
    }
    
    open static func ==(lhs: AbstractHandler, rhs: AbstractHandler) -> Bool {
        return lhs.id == rhs.id
    }
}
