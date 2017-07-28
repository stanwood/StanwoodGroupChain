//
//  SGCObject.swift
//  Pods
//
//  Created by Tal Zion on 28/07/2017.
//
//

import Foundation

// MARK: - Handler object protocol sets the object type
public protocol SGCObject {
    var type: SGCType { get }
    var target: Any { get }
    var userInfo: SGCUserInfo? { get }
    var resultComplition: SGCResultComplition { get set }
}
