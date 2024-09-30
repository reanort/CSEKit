//
//  CSEResponse+Protcol.swift
//  CSEKit
//
//  Created by Christian Norton on 9/30/24.
//

import Foundation

protocol CSEProtocol: Codable {
    var title: String? { get set }
    var totalResults: String? { get set }
    var searchTerms: String? { get set }
    var count: Int? { get set }
    var startIndex: Int? { get set }
    var startPage: Int? { get set }
    var language: String? { get set }
    var inputEncoding: String? { get set }
    var outputEncoding: String? { get set }
    var safe: String? { get set }
    var cx: String? { get set }
    var sort: String? { get set }
    var filter: String? { get set }
    var gl: String? { get set }
    var cr: String? { get set }
    var googleHost: String? { get set }
    var disableCnTwTranslation: String? { get set }
    var hq: String? { get set }
    var hl: String? { get set }
    var siteSearch: String? { get set }
    var siteSearchFilter: String? { get set }
    var exactTerms: String? { get set }
    var excludeTerms: String? { get set }
    var linkSite: String? { get set }
    var orTerms: String? { get set }
    var relatedSite: String? { get set }
    var dateRestrict: String? { get set }
    var lowRange: String? { get set }
    var highRange: String? { get set }
    var fileType: String? { get set }
    var rights: String? { get set }
    var searchType: String? { get set }
    var imgSize: String? { get set }
    var imgType: String? { get set }
    var imgColorType: String? { get set }
    var imgDominantColor: String? { get set }
}

