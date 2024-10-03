//
//  CSEFactory.swift
//  CSEKit
//
//  Created by Christian Norton on 9/30/24.
//

import Foundation

#if canImport(AppKit)
import AppKit
#endif

public struct CSEFactory : ~Copyable {
    @MainActor static private var sURL = "https://customsearch.googleapis.com/customsearch/v1"
    var api: String
    var engineID: String
    var query: String
    
    public init(apiKey: String, engineID: String, searchTerm: String){
        api = apiKey
        self.engineID = engineID
        query = searchTerm
    }
    
    @MainActor static public func main() {
        let api = ask("Enter your API Key:", "> ")
        let engineID = ask("Enter your Search Engine ID:", "> ")
        let searchTerm = ask("Enter your Search Term:", "> ")
        
        guard let apiKey = api, let engineID = engineID, let searchTerm = searchTerm else {
            print("Missing input, exiting.")
            return
        }
        
        var engine = CSEQuery(apiKey, engineID, searchTerm)
        print(engine)
        let fullURL = addToEngine(engine)
        print("Generated URL: \(fullURL)")
        
        print(CSESearch.addToEngine(engine))
        
        Task {
            let cseSearch = await CSESearch(&engine)
            do {
                try await cseSearch.downloadImages()
#if canImport(AppKit)
                NSApplication.shared.terminate(1)
#elseif os(iOS)
                exit(1)
#else
                abort()
#endif
                
            } catch {
                print("Error: \(error)")
            }
        }
    }
    
    public static func ask(_ question: String, _ delimiter: String) -> String? {
        print("\(question)\n\(delimiter)", terminator: "")
        return readLine()
    }
    
    @MainActor static public func addToEngine(_ query: CSEQuery) -> String {
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
        
        let finalURL = "\(sURL)?\(components.joined(separator: "&"))"
        return finalURL
    }
}
