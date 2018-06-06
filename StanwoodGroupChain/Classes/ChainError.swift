//
//  ChainError.swift
//
//  The MIT License (MIT)
//
//  Copyright (c) 2018 Stanwood GmbH (www.stanwood.io)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

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
