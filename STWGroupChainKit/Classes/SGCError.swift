//
//  SGCError.swift
//  Pods
//
//  Created by Tal Zion on 28/07/2017.
//
//

import Foundation

// MARK: - SGCErrpr types

public class SGCError: NSError {
    
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
    
    public init(userInfo: [SGCError.SGCErrorInfoKey : Any]) throws {
        
        // Converting CGSError userInfo to an NSError userInfo
        var info: [AnyHashable : Any] = [:]
        for infoItem in userInfo {
            if infoItem.key == .NSLocalizedRecoveryOptionsErrorKey {
                guard infoItem.value is [String] else { throw SGCError(message: "NSLocalizedRecoveryOptionsErrorKey must be an array of String") }
            }
            
            info.updateValue(infoItem.value, forKey: infoItem.key.description)
        }
        
        super.init(domain: SGCErrorKey.domain, code: SGCErrorKey.errorCode, userInfo: info)
    }
    
    convenience init(message: String) {
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
