//
//  SGCResponse.swift
//  Pods
//
//  Created by Tal Zion on 28/07/2017.
//
//

import Foundation

public class SGCResponse : Equatable {
    
    public let object: SGCResponseType
    
    /// Initialize a new `Response`.
    public init<T: SGCResponseType>(object: T) {
        self.object = object
    }
    
    public static func == (lhs: SGCResponse, rhs: SGCResponse) -> Bool {
        return lhs.object.id == rhs.object.id
    }
}
