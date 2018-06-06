//
//  HandlerFive.swift
//  STWGroupChainKit_Example
//
//  Created by Tal Zion on 09/10/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation
import StanwoodGroupChain

class HandlerFive: AbstractHandler {
    
    override func execute(_ element: ChainElement) {
        
        /// Make a networking call, load from file, run animation and return a result
        
        /// Access the target
        let target = element.target
        
        /// Use custom userInfo
        let userInfo = element.userInfo
        
        /// Return a response if reqruied on success
        let someItem = ModelItem()
        let response = ChainResponse(object: someItem)
        let successResult: ChainResult = .success(response)
        element.resultComplition?(successResult)
        
        /// Return an error if requried
        let error: ChainError = ChainError(message: "Something went wrong...")
        let failureResult: ChainResult = .failure(error)
        element.resultComplition?(failureResult)
    }
}
