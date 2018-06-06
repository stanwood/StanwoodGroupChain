//
//  HandlerTwo.swift
//  StanwoodGroupChain_Example
//
//  Created by Tal Zion on 27/09/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation
import StanwoodGroupChain

class HandlerTwo: AbstractHandler {
    
    override func execute(_ element: ChainElement) {
        print(id)
    }
}
