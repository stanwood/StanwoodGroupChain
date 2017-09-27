//
//  ViewController.swift
//  STWGroupChainKit
//
//  Created by Tal Zion on 07/26/2017.
//  Copyright (c) 2017 Tal Zion. All rights reserved.
//

import UIKit
import STWGroupChainKit

class ViewController: UIViewController {
    
    var chain: SGCChain?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let handlers = [HandlerOne(), HandlerTwo(), HandlerThree(), HandlerFour()]
        
        chain = SGCChain(handlers: handlers)
        
        let vc = UIViewController()
        
        let sgcObject = SGCObject(type: .type(HandlerTwo.self), target: vc) { (result) in
            
        }
        
        chain?.handel(sgcObject)
        
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
