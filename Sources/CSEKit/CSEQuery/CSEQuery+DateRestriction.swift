//
//  DateRestriction.swift
//  CSEKit
//
//  Created by Christian Norton on 9/30/24.
//

public extension CSEQuery {
    enum DateRestriction: Codable, Sendable {
        case d(Int)
        case w(Int)
        case m(Int)
        case y(Int)
        
        enum CodingKeys: String, CodingKey {
            case type, value
        }
        
        var stringValue: String {
            switch self {
                case .d: return "d"
                case .w: return "w"
                case .m: return "m"
                case .y: return "y"
            }
        }
        
        var intValue: Int {
            switch self {
                case .d(let value), .w(let value), .m(let value), .y(let value):
                    return value
            }
        }
        
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            let type = try container.decode(String.self, forKey: .type)
            let value = try container.decode(Int.self, forKey: .value)
            
            switch type {
                case "d": self = .d(value)
                case "w": self = .w(value)
                case "m": self = .m(value)
                case "y": self = .y(value)
                default:
                    throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Invalid date restriction type")
            }
        }
        
        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(stringValue, forKey: .type)
            try container.encode(intValue, forKey: .value)
        }
    }
}
