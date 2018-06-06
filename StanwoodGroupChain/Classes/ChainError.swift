//
//  ChainError.swift
//  Pods
//
//  Created by Tal Zion on 28/07/2017.
//  Copyright (c) 2018 Stanwood GmbH. All rights reserved.
//

import Foundation

// MARK: - SGCErrpr types

public class ChainError: NSError {
    
    private struct SGCErrorKey {
        static let domain = "SGCErrorDomain"
        static let errorCode = 1
    }
    
    public enum SGCErrorInfoKey:String, CustomStringConvertible {
        case NSLocalizedDescriptionKey = "NSLocalizedDescription"
        case NSLocalizedRecoverySuggestionErrorKey = "NSLocalizedRecoverySuggestion"
        case NSLocalizedFailureReasonErrorKey = "NSLocalizedFailureReason"
        case NSLocalizedRecoveryOptionsErrorKey = "NSLocalizedRecoveryOptions"
        case NSRecoveryAttempterErrorKey = "NSRecoveryAttempter"
        case NSHelpAnchorErrorKey = "NSHelpAnchorError"
        
        public var description: String {
            return rawValue
        }
    }
    
    public init(userInfo: [ChainError.SGCErrorInfoKey : Any]) throws {
        
        // Converting CGSError userInfo to an NSError userInfo
        var info: [String : Any] = [:]
        for infoItem in userInfo {
            if infoItem.key == .NSLocalizedRecoveryOptionsErrorKey {
                guard infoItem.value is [String] else { throw ChainError(message: "NSLocalizedRecoveryOptionsErrorKey must be an array of String") }
            }
            
            info.updateValue(infoItem.value, forKey: infoItem.key.description)
        }
        
        super.init(domain: SGCErrorKey.domain, code: SGCErrorKey.errorCode, userInfo: info)
    }
    
    public convenience init(message: String) {
        let info = [SGCErrorInfoKey.NSLocalizedDescriptionKey: message]
        try! self.init(userInfo: info)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        #if DEBUG
            print("init(coder:) has not been implemented")
        #endif
    }
}
