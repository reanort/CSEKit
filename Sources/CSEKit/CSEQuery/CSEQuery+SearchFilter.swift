//
//  SearchFilter.swift
//  CSEKit
//
//  Created by Christian Norton on 9/30/24.
//

public extension CSEQuery {
    enum SearchFilter: String, Codable, Sendable {
        case exclude
        case include
        enum CodingKeys: String, CodingKey {
            case exclude = "e"
            case include = "i"
        }
    }
}
