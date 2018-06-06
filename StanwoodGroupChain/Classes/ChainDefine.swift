//
//  ChainDefine.swift
//  Pods
//
//  Created by Tal Zion on 28/07/2017.
//  Copyright (c) 2018 Stanwood GmbH. All rights reserved.
//

import Foundation

public typealias ChainUserInfo = [String: Any]
public typealias ChainCompletionBlock = (_ object: ChainElement)-> Void
public typealias ChainResultCompletion = Optional<((_ result: GroupChainResult<ChainResponse, ChainError>) -> Void)>
