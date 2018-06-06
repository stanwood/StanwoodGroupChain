//
//  Handler.swift
//  Pods
//
//  Created by Tal Zion on 28/07/2017.
//
//

import Foundation

// MARK: - ChainElement

public struct ChainElement: ChainElementType {
    
    // userInfo to hasnle any system notifications
    public  var userInfo: ChainUserInfo?
    
    // The type to the SGC will catch
    public var type: ChainHandleType
    
    // Any target that in necessary to handel the operation
    public var target: Any
    
    // Complition & Failure blocks to support the readiness of the operation
    public var resultComplition: ChainResultCompletion
    
    public init(type: ChainHandleType, target: Any, userInfo: ChainUserInfo? = nil, compltion: ChainResultCompletion) {
        self.type = type
        self.target = target
        self.userInfo = userInfo
        
        resultComplition = compltion
    }
}
