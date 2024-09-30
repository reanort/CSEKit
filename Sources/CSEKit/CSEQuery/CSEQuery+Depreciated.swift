//
//  File.swift
//  CSEKit
//
//  Created by Christian Norton on 9/30/24.
//

import Foundation

public extension CSEQuery {
    @available(*, deprecated, renamed: "gl", message: "Deprecated. Use the gl parameter for a similar effect.")
    nonisolated(unsafe) private static var _googlehost: String? = nil
    @available(*, deprecated, renamed: "gl", message: "Deprecated. Use the gl parameter for a similar effect.")
    var googlehost: String? {
        get {
            return CSEQuery._googlehost
        }
        set {
            CSEQuery._googlehost = newValue
        }
    }
    
    
    @available(*, deprecated, renamed: ".", message: "Deprecated.")
    nonisolated(unsafe) private static var _relatedSite: String? = nil
    @available(*, deprecated, renamed: ".", message: "Deprecated.")
    var relatedSite: String? {
        get {
            return CSEQuery._relatedSite
        }
        set {
            CSEQuery._relatedSite = newValue
        }
    }
}

//public extension CSEQuery.Safety {
//    @available(*, deprecated, renamed: "active", message: "Deprecated, equivalent to \"active\"")
//    case high
//    @available(*, deprecated, renamed: "active", message: "Deprecated, equivalent to \"active\"")
//    case medium
//}
