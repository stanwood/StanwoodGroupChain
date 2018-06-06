//
//  HandlerType.swift
//  Pods
//
//  Created by Tal Zion on 28/07/2017.
//  Copyright (c) 2018 Stanwood GmbH. All rights reserved.
//

import Foundation

public protocol HandlerType: class {
    var successor: HandlerType? { get set }
    var id: String { get }
    
    func execute(_ element: ChainElement)
}

extension HandlerType  {
    
    func set(_ successor: HandlerType) {
        self.successor = successor
    }
    
    func handel(_ element: ChainElement) {
        initiate(with: element)
    }
    
    func initiate(type: ChainHandleType = .type(Self.self as AnyClass), with element: ChainElement) {
        ///Check if the current type equals to currentHandler
        switch (type, element.type) {
        case (.type(let currentType), .type(let toType)):
            switch currentType == toType {
            case true:
                
                /// Executre handler block
                
                execute(element)
            case false:
                ///Execute the next handler in the SGC
                ///IMPORTANT NOTE: In case the current handler is the last in the SGC, force a crash to make sure you handle all types:
                
                if successor != nil {
                    self.successor?.handel(element)
                } else {
                    fatalError("No handler takes care of me! Make sure to add me to the SGC...")
                }
            }
        }
    }
}
