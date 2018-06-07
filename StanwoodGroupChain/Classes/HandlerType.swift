//
//  HandlerType.swift
//
//  The MIT License (MIT)
//
//  Copyright (c) 2018 Stanwood GmbH (www.stanwood.io)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

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
