//
//  SecretBoolean.swift
//  CSEKit
//
//  Created by Christian Norton on 9/30/24.
//

public extension CSEQuery {
    enum SecretBoolean: Int, Codable, Sendable {
        case yes = 1
        case no = 0
    }
}
