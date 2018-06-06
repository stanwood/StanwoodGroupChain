//
//  ViewController.swift
//  StanwoodGroupChain
//
//  Created by talezion on 06/06/2018.
//  Copyright (c) 2018 talezion. All rights reserved.
//

import UIKit
import StanwoodGroupChain

class ViewController: UIViewController {
    
    var chain: Chain?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let handlers = [HandlerOne(), HandlerTwo(), HandlerThree(), HandlerFour(), HandlerFive(), HandlerSix()]
        
        chain = Chain(handlers: handlers)
        
        let sgcObject = ChainElement(type: .type(HandlerSix.self), target: self) { (result) in
            
        }
        
        chain?.handel(sgcObject)
        
    }
}

