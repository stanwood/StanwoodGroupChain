//
//  ChainResponse.swift
//  Pods
//
//  Created by Tal Zion on 28/07/2017.
//
//

import Foundation

public class ChainResponse : Equatable {
    
    public let object: ChainResponseType
    
    /// Initialize a new `Response`.
    public init<T: ChainResponseType>(object: T) {
        self.object = object
    }
    
    public static func == (lhs: ChainResponse, rhs: ChainResponse) -> Bool {
        return lhs.object.id == rhs.object.id
    }
}
