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
    
    var chain: SGCChain?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let handlers = [HandlerOne(), HandlerTwo(), HandlerThree(), HandlerFour(), HandlerFive(), HandlerSix()]
        
        chain = SGCChain(handlers: handlers)
        
        let vc = UIViewController()
        
        let sgcObject = SGCObject(type: .type(HandlerOne.self), target: vc) { (result) in
            
        }
        
        chain?.handel(sgcObject)
        
    }
}

