//
//  SGCDefine.swift
//  Pods
//
//  Created by Tal Zion on 28/07/2017.
//
//

import Foundation

public typealias SGCUserInfo = [String: Any]
public typealias SGCBlock = (_ object: SGCObject)-> Void
public typealias SGCResultComplition = Optional<((_ result: STWSGCResult<SGCResponse, SGCError>) -> Void)>
