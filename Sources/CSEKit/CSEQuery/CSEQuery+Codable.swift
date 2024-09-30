//
//  CSEQuery+Codable.swift
//  CSEKit
//
//  Created by Christian Norton on 9/30/24.
//

public extension CSEQuery {
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encodeIfPresent(c2coff, forKey: .c2coff)
        try container.encodeIfPresent(cr, forKey: .cr)
        try container.encodeIfPresent(dateRestrict, forKey: .dateRestrict)
        try container.encodeIfPresent(exactTerms, forKey: .exactTerms)
        try container.encodeIfPresent(excludeTerms, forKey: .excludeTerms)
        try container.encodeIfPresent(fileType, forKey: .fileType)
        try container.encodeIfPresent(filter, forKey: .filter)
        try container.encodeIfPresent(gl, forKey: .gl)
        try container.encodeIfPresent(googlehost, forKey: .googlehost)
        try container.encodeIfPresent(relatedSite, forKey: .relatedSite)
        try container.encodeIfPresent(highRange, forKey: .highRange)
        try container.encodeIfPresent(lowRange, forKey: .lowRange)
        try container.encodeIfPresent(hl, forKey: .hl)
        try container.encodeIfPresent(hq, forKey: .hq)
        try container.encodeIfPresent(imgColorType, forKey: .imgColorType)
        try container.encodeIfPresent(imgDominantColor, forKey: .imgDominantColor)
        try container.encodeIfPresent(imgSize, forKey: .imgSize)
        try container.encodeIfPresent(imgType, forKey: .imgType)
        try container.encodeIfPresent(linkSite, forKey: .linkSite)
        try container.encodeIfPresent(lr, forKey: .lr)
        try container.encodeIfPresent(num, forKey: .num)
        try container.encodeIfPresent(orTerms, forKey: .orTerms)
        try container.encodeIfPresent(rights, forKey: .rights)
        try container.encodeIfPresent(safe, forKey: .safe)
        try container.encodeIfPresent(searchType, forKey: .searchType)
        try container.encodeIfPresent(siteSearchFilter, forKey: .siteSearchFilter)
        try container.encodeIfPresent(sort, forKey: .sort)
        try container.encodeIfPresent(start, forKey: .start)
        
        try container.encode(cx, forKey: .cx)
        try container.encode(q, forKey: .q)
        try container.encode(key, forKey: .key)
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        c2coff = try container.decodeIfPresent(SecretBoolean.self, forKey: .c2coff)
        cr = try container.decodeIfPresent(String.self, forKey: .cr)
        dateRestrict = try container
            .decodeIfPresent(
                SecretBoolean.self,
                forKey: .dateRestrict
            )
        exactTerms = try container.decodeIfPresent(String.self, forKey: .exactTerms)
        excludeTerms = try container.decodeIfPresent(String.self, forKey: .excludeTerms)
        fileType = try container.decodeIfPresent(String.self, forKey: .fileType)
        filter = try container.decodeIfPresent(SecretBoolean.self, forKey: .filter)
        gl = try container.decodeIfPresent(CSEQuery.CountryCode.self, forKey: .gl)
        googlehost = try container.decodeIfPresent(String.self, forKey: .googlehost)
        relatedSite = try container.decodeIfPresent(String.self, forKey: .relatedSite)
        highRange = try container.decodeIfPresent(String.self, forKey: .highRange)
        lowRange = try container.decodeIfPresent(String.self, forKey: .lowRange)
        hl = try container.decodeIfPresent(CSEQuery.CountryCode.self, forKey: .hl)
        hq = try container.decodeIfPresent(String.self, forKey: .hq)
        imgColorType = try container.decodeIfPresent(CSEQuery.ImgColorType.self, forKey: .imgColorType)
        imgDominantColor = try container.decodeIfPresent(CSEQuery.ImgDominantColor.self, forKey: .imgDominantColor)
        imgSize = try container.decodeIfPresent(CSEQuery.ImgSize.self, forKey: .imgSize)
        imgType = try container.decodeIfPresent(CSEQuery.ImgType.self, forKey: .imgType)
        linkSite = try container.decodeIfPresent(String.self, forKey: .linkSite)
        lr = try container
            .decodeIfPresent(CSEQuery.LanguageCode.self, forKey: .lr) ?? .en
        num = try container.decodeIfPresent(Int.self, forKey: .num)
        orTerms = try container.decodeIfPresent(String.self, forKey: .orTerms)
        rights = try container.decodeIfPresent(CSEQuery.Rights.self, forKey: .rights)
        safe = try container.decodeIfPresent(CSEQuery.Safety.self, forKey: .safe)
        searchType = try container.decodeIfPresent(CSEQuery.SearchType.self, forKey: .searchType)
        siteSearchFilter = try container.decodeIfPresent(CSEQuery.SearchFilter.self, forKey: .siteSearchFilter)
        sort = try container.decodeIfPresent(String.self, forKey: .sort)
        start = try container.decodeIfPresent(UInt32.self, forKey: .start)
        
        cx = try container.decode(String.self, forKey: .cx)
        q = try container.decode(String.self, forKey: .q)
        key = try container.decode(String.self, forKey: .key)
    }
    
    enum CodingKeys: CodingKey {
        case c2coff
        case cr
        case dateRestrict
        case exactTerms
        case excludeTerms
        case fileType
        case filter
        case gl
        case googlehost
        case relatedSite
        case highRange
        case lowRange
        case hl
        case hq
        case imgColorType
        case imgDominantColor
        case imgSize
        case imgType
        case linkSite
        case lr
        case num
        case orTerms
        case rights
        case safe
        case searchType
        case siteSearchFilter
        case sort
        case start
        case cx
        case q
        case key
    }
}
