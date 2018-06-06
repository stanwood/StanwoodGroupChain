//
//  HandlerThree.swift
//  STWGroupChainKit_Example
//
//  Created by Tal Zion on 09/10/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation
import StanwoodGroupChain

class HandlerThree: AbstractHandler {
    override func execute(object: ChainElement) {
        print(id)
    }
}
