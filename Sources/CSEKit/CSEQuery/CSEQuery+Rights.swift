//
//  Rights.swift
//  CSEKit
//
//  Created by Christian Norton on 9/30/24.
//

public extension CSEQuery {
    enum Rights: String, Codable, Sendable {
        case attribute = "cc_attribute"
        case noncommerical = "cc_noncommerical"
        case nonderived = "cc_nonderived"
        case sharealike = "cc_sharealike"
        case pDomain = "cc_publicdomain"
    }
}
