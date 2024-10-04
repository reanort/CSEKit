// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

public struct CSEKit : ~Copyable{
    public var search: CSESearch?
    public var response: CSEResponse?
    public var result: CSEResult?
    public var item: CSEItem?
    public var query : CSEQuery?
    public var anyCodable: AnyCodable?
    public var factory: CSEFactory?
}

@MainActor
public struct CSESearch: Sendable {
    var query: CSEQuery?
    var finalURL: String?
    var finalResponse: CSEResponse?
    
    public static func addToEngine(_ query: CSEQuery) -> String {
        var components = [String]()
        
        if let key = query.key { components.append("key=\(key)") }
        if let cx = query.cx { components.append("cx=\(cx)") }
        if let q = query.q { components.append("q=\(q)") }
        if let c2coff = query.c2coff { components.append("c2coff=\(c2coff)") }
        if let cr = query.cr { components.append("cr=\(cr)") }
        if let dateRestrict = query.dateRestrict { components.append("dateRestrict=\(dateRestrict)") }
        if let exactTerms = query.exactTerms { components.append("exactTerms=\(exactTerms)") }
        if let excludeTerms = query.excludeTerms { components.append("excludeTerms=\(excludeTerms)") }
        if let fileType = query.fileType { components.append("fileType=\(fileType)") }
        if let filter = query.filter { components.append("filter=\(filter)") }
        if let gl = query.gl { components.append("gl=\(gl)") }
        if let googlehost = query.googlehost { components.append("googlehost=\(googlehost)") }
        if let relatedSite = query.relatedSite { components.append("relatedSite=\(relatedSite)") }
        if let highRange = query.highRange { components.append("highRange=\(highRange)") }
        if let lowRange = query.lowRange { components.append("lowRange=\(lowRange)") }
        if let hl = query.hl { components.append("hl=\(hl)") }
        if let hq = query.hq { components.append("hq=\(hq)") }
        if let imgColorType = query.imgColorType { components.append("imgColorType=\(imgColorType)") }
        if let imgDominantColor = query.imgDominantColor { components.append("imgDominantColor=\(imgDominantColor)") }
        if let imgSize = query.imgSize { components.append("imgSize=\(imgSize)") }
        if let imgType = query.imgType { components.append("imgType=\(imgType)") }
        if let linkSite = query.linkSite { components.append("linkSite=\(linkSite)") }
        if let lr = query.lr { components.append("lr=\(lr)") }
        if let num = query.num { components.append("num=\(num)") }
        if let orTerms = query.orTerms { components.append("orTerms=\(orTerms)") }
        if let rights = query.rights { components.append("rights=\(rights)") }
        if let safe = query.safe { components.append("safe=\(safe)") }
        if let searchType = query.searchType { components.append("searchType=\(searchType)") }
        if let siteSearchFilter = query.siteSearchFilter { components.append("siteSearchFilter=\(siteSearchFilter)") }
        if let sort = query.sort { components.append("sort=\(sort)") }
        if let start = query.start { components.append("start=\(start)") }
        
        let finalURL = "https://customsearch.googleapis.com/customsearch/v1?\(components.joined(separator: "&"))"
        return finalURL
    }
    
    public func downloadImages() async throws {
        guard var query = self.query else {
            throw NSError(domain: "CSESearch", code: 1, userInfo: [NSLocalizedDescriptionKey: "Query is nil"])
        }
        guard let searchTerm = query.q else {
            throw NSError(domain: "CSESearch", code: 2, userInfo: [NSLocalizedDescriptionKey: "Search term is nil"])
        }
        
        // Ensure searchType is set to 'image'
        query.searchType = .image
        
        // Build the URL
        let urlString = CSESearch.addToEngine(query)
        guard let url = URL(string: urlString) else {
            throw NSError(domain: "CSESearch", code: 3, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])
        }
        
        // Perform the request
        let (data, _) = try await URLSession.shared.data(from: url)
        
        // Parse the response
        let decoder = JSONDecoder()
        let cseResponse = try decoder.decode(CSEResponse.self, from: data)
        
        // Extract image URLs
        guard let items = cseResponse.items else {
            print("No items found in response")
            return
        }
        
        // Create folder
        let fileManager = FileManager.default
        let currentDirectoryURL = URL(fileURLWithPath: fileManager.currentDirectoryPath)
        let folderURL = currentDirectoryURL.appendingPathComponent(searchTerm)
        try fileManager.createDirectory(at: folderURL, withIntermediateDirectories: true, attributes: nil)
        
        // Iterate over items and download images
        for (index, item) in items.enumerated() {
            if let imageURLString = item.link, let imageURL = URL(string: imageURLString) {
                print("Image URL: \(imageURLString)")
                
                do {
                    let (imageData, _) = try await URLSession.shared.data(from: imageURL)
                    // Save the image data to the folder
                    let fileExtension = imageURL.pathExtension.isEmpty ? "jpg" : imageURL.pathExtension
                    let fileName = "image\(index).\(fileExtension)"
                    let fileURL = folderURL.appendingPathComponent(fileName)
                    try imageData.write(to: fileURL)
                } catch {
                    print("Failed to download image from \(imageURLString): \(error)")
                }
            } else {
                print("No valid image link in item")
            }
        }
    }
    
    
    public init(_ input: inout CSEQuery) async {
        self.query = input
    }
}

public struct CSEResponse: Codable, Sendable {
    let kind: String?
    let url: Url?
    let queries: Queries?
    let promotions: [Promotion]?
    let context: Dictionary<String, AnyCodable>?
    let searchInformation: SearchInformation?
    let spelling: Spelling?
    let items: [CSEResult]?
    
    struct Url: Codable {
        let type: String?
        let template: String?
    }
    struct Queries: Codable {
        let previousPage,request,nextPage: [CSEItem]?
    }
    struct Promotion: Codable {
        let title: String?
        let htmlTitle: String?
        let link: String?
        let displayLink: String?
        let bodyLines: [BodyLines]?
        let image: Image?
    }
    struct BodyLines: Codable {
        let title: String?
        let htmlTitle: String?
        let url: String?
        let link: String?
    }
    struct Image: Codable {
        let source: String?
        let width: Int?
        let height: Int?
    }
    struct SearchInformation: Codable {
        let searchTime: Decimal?
        let formattedSearchTime: String?
        let totalResults: String?
        let formattedTotalResults: String?
    }
    struct Spelling: Codable {
        let correctedQuery: String?
        let htmlCorrectedQuery: String?
    }
}

public struct CSEResult: Codable, Sendable{
    let kind: String?
    let title: String?
    let htmlTitle: String?
    let link: String?
    let displayLink: String?
    let snippet: String?
    let htmlSnippet: String?
    let cacheId: String?
    let formattedUrl: String?
    let htmlFormattedUrl: String?
    let pagemap: String?
    let mime: String?
    let fileFormat: String?
    let image: Image?
    let labels: Labels?
    
    struct Image: Codable, Sendable {
        let contextLink: String?
        let height: Int?
        let width: Int?
        let bytesize: Int?
        let thumbnailLink: String?
        let thumbnailHeight: Int?
        let thumbnailWidth: Int?
    }
    struct Labels: Codable, Sendable {
        let name: String?
        let displayName: String?
        let label_with_op: String?
    }
}

public struct CSEItem: CSEProtocol, Codable, Sendable {
    var title: String?
    var totalResults: String?
    var searchTerms: String?
    var count: Int?
    var startIndex: Int?
    var startPage: Int?
    var language: String?
    var inputEncoding: String?
    var outputEncoding: String?
    var safe: String?
    var cx: String?
    var sort: String?
    var filter: String?
    var gl: String?
    var cr: String?
    var googleHost: String?
    var disableCnTwTranslation: String?
    var hq: String?
    var hl: String?
    var siteSearch: String?
    var siteSearchFilter: String?
    var exactTerms: String?
    var excludeTerms: String?
    var linkSite: String?
    var orTerms: String?
    var relatedSite: String?
    var dateRestrict: String?
    var lowRange: String?
    var highRange: String?
    var fileType: String?
    var rights: String?
    var searchType: String?
    var imgSize: String?
    var imgType: String?
    var imgColorType: String?
    var imgDominantColor: String?
}
