//
//  OP_HASH160.swift
//  BitcoinKit
//
//  Created by Shun Usami on 2018/07/27.
//  Copyright © 2018 BitcoinKit-cash developers. All rights reserved.
//

import Foundation

public struct OpHash160: OpCodeProtocol {
    public var value: UInt8 { return 0xa9 }
    public var name: String { return "OP_HASH160" }

    public func execute(_ context: ScriptExecutionContext) throws {
        try prepareExecute(context)
        // (in -- hash)
        guard context.stack.count >= 1 else {
            throw OpCodeExecutionError.opcodeRequiresItemsOnStack(1)
        }

        let data: Data = context.stack.removeLast()
        let hash: Data = Crypto.sha256ripemd160(data)
        context.stack.append(hash)
    }
}
