//
//  File.swift
//  CSEKit
//
//  Created by Christian Norton on 9/30/24.
//

import Foundation

public struct AnyCodable: Codable, Sendable {
    public let value: SendableCodableValue

    public init<T: Sendable & Codable>(_ value: T) {
        self.value = SendableCodableValue(value)
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()

        if let stringValue = try? container.decode(String.self) {
            value = .string(stringValue)
        } else if let intValue = try? container.decode(Int.self) {
            value = .int(intValue)
        } else if let doubleValue = try? container.decode(Double.self) {
            value = .double(doubleValue)
        } else if let boolValue = try? container.decode(Bool.self) {
            value = .bool(boolValue)
        } else if let arrayValue = try? container.decode([AnyCodable].self) {
            value = .array(arrayValue)
        } else if let dictValue = try? container.decode([String: AnyCodable].self) {
            value = .dictionary(dictValue)
        } else {
            throw DecodingError.dataCorruptedError(in: container, debugDescription: "Unsupported type")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()

        switch value {
        case .string(let value):
            try container.encode(value)
        case .int(let value):
            try container.encode(value)
        case .double(let value):
            try container.encode(value)
        case .bool(let value):
            try container.encode(value)
        case .array(let value):
            try container.encode(value)
        case .dictionary(let value):
            try container.encode(value)
        }
    }
}

public enum SendableCodableValue: Sendable, Codable {
    case string(String)
    case int(Int)
    case double(Double)
    case bool(Bool)
    case array([AnyCodable])
    case dictionary([String: AnyCodable])

    // Convenience initializer for Codable values
    public init<T: Codable & Sendable>(_ value: T) {
        switch value {
        case let value as String:
            self = .string(value)
        case let value as Int:
            self = .int(value)
        case let value as Double:
            self = .double(value)
        case let value as Bool:
            self = .bool(value)
        case let value as [AnyCodable]:
            self = .array(value)
        case let value as [String: AnyCodable]:
            self = .dictionary(value)
        default:
            fatalError("Unsupported type") // Optionally handle unsupported types
        }
    }
}
