//
//  Handler.swift
//  Pods
//
//  Created by Tal Zion on 28/07/2017.
//
//

import Foundation

// MARK: - SGCHandler

public struct SGCHandler: SGCObject {
    
    // userInfo to hasnle any system notifications
    public  var userInfo: SGCUserInfo?
    
    // The type to the SGC will catch
    public var type: SGCType
    
    // Any target that in necessary to handel the operation
    public var target: Any
    
    // Complition & Failure blocks to support the readiness of the operation
    public var resultComplition: SGCResultComplition
    
    public init(type: SGCType, target: Any, userInfo: SGCUserInfo? = nil, compltion: SGCResultComplition) {
        self.type = type
        self.target = target
        self.userInfo = userInfo
        
        resultComplition = compltion
    }
}
