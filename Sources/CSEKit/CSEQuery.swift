//
//  CSEQuery+List.swift
//  CSEKit
//
//  Created by Christian Norton on 9/30/24.
//

import Foundation

// GET https://customsearch.googleapis.com/customsearch/v1

public struct CSEQuery: Codable, Sendable {
    public var c2coff: SecretBoolean? = nil // Enables or disables Simplified and Traditional Chinese Search.
    public var cr: String? = nil // Restricts search results to documents originating in a particular country.
    public var dateRestrict: SecretBoolean? = nil // Restricts results to URLs based on date
    public var exactTerms: String? = nil
    public var excludeTerms: String? = nil
    public var fileType: String? = nil
    public var filter: SecretBoolean? = nil
    public var gl: CSEQuery.CountryCode? = nil
    public var highRange: String? = nil
    public var lowRange: String? = nil
    public var hl: CSEQuery.CountryCode? = nil // 2 char CountryCode
    public var hq: String? = nil
    public var imgColorType: CSEQuery.ImgColorType? = nil
    public var imgDominantColor: CSEQuery.ImgDominantColor? = nil
    public var imgSize: CSEQuery.ImgSize? = nil
    public var imgType: CSEQuery.ImgType? = nil
    public var linkSite: String? = nil
    public var lr: CSEQuery.LanguageCode? = nil // "lang_" prefix
    public var num: Int? = nil
    public var orTerms: String? = nil
    public var rights: CSEQuery.Rights? = nil
    public var safe: CSEQuery.Safety? = nil
    public var searchType: CSEQuery.SearchType? = nil
    public var siteSearchFilter: CSEQuery.SearchFilter? = nil
    public var sort: String? = nil
    public var start: UInt32? = nil
    
    // required
    public var cx: String?
    public var q: String?
    public var key: String?
    
    public init(_ key: String, _ cx: String, _ q: String){
        self.cx = cx
        self.q = q
        self.key = key
    }
    
    public init(){
        self.cx = ""
        self.q = ""
        self.key = ""
    }
}
