//
//  ImgColorType.swift
//  CSEKit
//
//  Created by Christian Norton on 9/30/24.
//


public extension CSEQuery {
    enum ImgColorType: String, Codable, Sendable {
        case color
        case gray
        case mono
        case trans
    }
}
