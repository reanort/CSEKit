//
//  ImgType.swift
//  CSEKit
//
//  Created by Christian Norton on 9/30/24.
//

public extension CSEQuery {
    enum ImgType: String, Codable, Sendable {
        case clipart
        case face
        case lineart
        case stock
        case photo
        case animated
    }
}
