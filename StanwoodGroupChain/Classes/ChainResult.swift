//
//  STWSGCResult.swift
//  Pods
//
//  Created by Tal Zion on 28/07/2017.
//  Copyright (c) 2018 Stanwood GmbH. All rights reserved.
//

import Foundation

public typealias ChainResult = GroupChainResult<ChainResponse, ChainError>

// MARK: - Result
/// An enum representing either a failure with an explanatory error, or a success with a result value.
public enum GroupChainResult<T: ChainResponse, Error: ChainError>: CustomStringConvertible, CustomDebugStringConvertible {
    case success(T)
    case failure(Error)
    
    // MARK: Constructors
    
    /// Constructs a success wrapping a `value`.
    public init(value: T) {
        self = .success(value)
    }
    
    /// Constructs a failure wrapping an `error`.
    public init(error: Error) {
        self = .failure(error)
    }
    
    /// Constructs a result from an `Optional`, failing with `Error` if `nil`.
    public init(_ value: T?, failWith: @autoclosure () -> Error) {
        self = value.map(GroupChainResult.success) ?? .failure(failWith())
    }
    
    // MARK: Deconstruction
    
    /// Returns the value from `success` Results or `throw`s the error.
    public func dematerialize() throws -> T {
        switch self {
        case let .success(value):
            return value
        case let .failure(error):
            throw error
        }
    }
    
    /// Case analysis for Result.
    ///
    /// Returns the value produced by applying `ifFailure` to `failure` Results, or `ifSuccess` to `success` Results.
    public func analysis<Result>(ifSuccess: (T) -> Result, ifFailure: (Error) -> Result) -> Result {
        switch self {
        case let .success(value):
            return ifSuccess(value)
        case let .failure(value):
            return ifFailure(value)
        }
    }
    
    // MARK: CustomStringConvertible
    
    public var description: String {
        return analysis(
            ifSuccess: { ".success(\($0))" },
            ifFailure: { ".failure(\($0))" })
    }
    
    
    // MARK: CustomDebugStringConvertible
    
    public var debugDescription: String {
        return description
    }
}
