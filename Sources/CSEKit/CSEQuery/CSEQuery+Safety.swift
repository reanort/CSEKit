//
//  Safety.swift
//  CSEKit
//
//  Created by Christian Norton on 9/30/24.
//

public extension CSEQuery {
    enum Safety: String, Codable, Sendable {
        case active
        case off
        @available(*, deprecated, renamed: "active", message: "Deprecated, equivalent to \"active\"")
        case high
        @available(*, deprecated, renamed: "active", message: "Deprecated, equivalent to \"active\"")
        case medium
    }
}
