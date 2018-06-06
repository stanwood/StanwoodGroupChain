//
//  ChainResult.swift
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
