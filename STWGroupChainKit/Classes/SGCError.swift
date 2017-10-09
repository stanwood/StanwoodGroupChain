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
        case NSLocalizedDescriptionKey
        case NSLocalizedRecoverySuggestionErrorKey
        case NSLocalizedFailureReasonErrorKey
        case NSLocalizedRecoveryOptionsErrorKey
        case NSRecoveryAttempterErrorKey
        case NSHelpAnchorErrorKey
        
        public var description: String {
            return rawValue
        }
    }
    
    public init(userInfo: [SGCErrorInfoKey: String]) {
        super.init(domain: SGCErrorKey.domain, code: SGCErrorKey.errorCode, userInfo: userInfo)
    }
    
    convenience init(message: String) {
        let info = [SGCErrorInfoKey.NSLocalizedDescriptionKey: message]
        self.init(userInfo: info)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        #if DEBUG
            print("init(coder:) has not been implemented")
        #endif
    }
}
