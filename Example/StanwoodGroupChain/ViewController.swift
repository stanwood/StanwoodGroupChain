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
        
        let handlerFour = ChainElement(type: .type(HandlerSix.self), target: self) { (result) in
            
            switch result {
            case .failure(let error): print("Handle error, \(error.description)")
            case .success(let item): print("Handle item, \(item)")
                
                /// Call the next handler
            }
        }
        
        let handlerOne = ChainElement(type: .type(HandlerSix.self), target: self) { [weak self, handlerFour = handlerFour] (result) in
            
            guard let `self` = self else { return }
            
            switch result {
            case .failure(let error): print("Handle error, \(error.description)")
            case .success(let item): print("Handle item, \(item)")
                
                /// Call the next handler
                
                self.chain?.handel(handlerFour)
            }
        }
        
        chain?.handel(handlerOne)
    }
}

