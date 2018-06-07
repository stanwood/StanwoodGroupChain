//
//  HandlerTwo.swift
//  StanwoodGroupChain_Example
//
//  Created by Tal Zion on 27/09/2017.
//  Copyright (c) 2018 Stanwood GmbH. All rights reserved.
//

import Foundation
import StanwoodGroupChain

class HandlerTwo: AbstractHandler {
    
    override func execute(_ element: ChainElement) {
        print(id)
    }
}
