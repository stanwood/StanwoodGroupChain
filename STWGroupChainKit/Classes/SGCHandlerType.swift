//
//  SGCHandlerType.swift
//  Pods
//
//  Created by Tal Zion on 28/07/2017.
//
//

import Foundation

public protocol SGCHandlerType: class {
    var successor: SGCHandlerType? { get set }
    var id: String { get }
    
    func execute(object: SGCObject)
}

extension SGCHandlerType  {
    
    func set(_ successor: SGCHandlerType) {
        self.successor = successor
    }
    
    func handel(_ object: SGCObject) {
        initiate(with: object)
    }
    
    func initiate(type: SGCType = .type(Self.self as AnyClass), with object: SGCObject) {
        ///Check if the current type equals to currentHandler
        switch (type, object.type) {
        case (.type(let SGCType), .type(let toType)):
            switch SGCType == toType {
            case true:
                
                /// MARK: Add logic here
                // @optional -- uncomment to user target
                
                execute(object: object)
            case false:
                ///Execute the next handler in the SGC
                ///IMPORTANT NOTE: In case the current handler is the last in the SGC, force a crash to make sure you handle all types:
                
                if successor != nil {
                    self.successor?.handel(object)
                } else {
                    fatalError("No handler takes care of me! Make sure to add me to the SGC...")
                }
            }
        }
    }
}