//: Playground - noun: a place where people can play

import UIKit
import STWGroupChainKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

var str = "Hello, playground"
print(str)

class HandlerOne: SGCAbstractHandler {
    override func execute(object: SGCObject) {
        print(id)
    }
}

class HandlerTwo: SGCAbstractHandler {
    override func execute(object: SGCObject) {
        print(id)
    }
}

class HandlerThree: SGCAbstractHandler {
    override func execute(object: SGCObject) {
        print(id)
    }
}

class HandlerFour: SGCAbstractHandler {
    override func execute(object: SGCObject) {
        print(id)
    }
}

let handlers = [HandlerOne(), HandlerTwo(), HandlerThree(), HandlerFour()]

let chain  = SGCChain(handlers: handlers)

let vc = UIViewController()

let sgcObject = SGCObject(type: .type(HandlerOne.self), target: vc) { (result) in
    
}

chain.handel(sgcObject)
