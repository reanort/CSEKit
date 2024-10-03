//
//  CSEQuery+List.swift
//  CSEKit
//
//  Created by Christian Norton on 9/30/24.
//

import Foundation
import UniformTypeIdentifiers

// GET https://customsearch.googleapis.com/customsearch/v1

/// Google CSE.List. Returns metadata about the search performed, metadata about the engine used for the search, and the search results.
///  - Parameters:
///  	- key: API Key from GCP.
///     - cx: Custom Search Engine ID.
///     - q: Search term.
///
public struct CSEQuery: Codable, Sendable {
    
    /// Enables or disables Simplified and Traditional Chinese Search.
    public var c2coff: SecretBoolean? = nil
    
    /// Restricts search results to documents originating in a particular country.
    public var cr: String? = nil
                                 
    /// Restricts results to URLs based on
    public var dateRestrict: SecretBoolean? = nil
                                         
    /// Identifies a phrase that all documents in the search results must contain.
    public var exactTerms: String? = nil
                                         
    /// Identifies a word or phrase that should not appear in any documents in the search results.
    public var excludeTerms: String? = nil
                                    
    /// Restricts results to files of a specified extension. A list of file types indexable by Google can be found in Search Console Help Center
    public var fileType: UTType? = nil
                                       
    /// Controls turning on or off the duplicate content filter. See Automatic Filtering for more information about Google's search
    /// filters. By default, Google applies filtering to all search results to improve the quality of those results.
    public var filter: SecretBoolean? = nil
                                            
    /// Geolocation of end user. gl parameter value is a two-letter country code, which should lead to more relevant results. This is
	/// particularly true for international customers and, even more specifically, for customers in English- speaking countries other
	/// than the United States.
    public var gl: CSEQuery.LangCode? = nil
                                            
    /// Specifies the ending value for a search range.
    public var highRange: String? = nil
                                       
    /// Specifies the starting value for a search range. Use lowRange and highRange to append an inclusive search range of
	/// lowRange...highRange to the query.
    public var lowRange: String? = nil
                                    
    /// Sets the user interface language. Explicitly setting this parameter improves the performance and the quality of your search
	/// results.
    public var hl: CSEQuery.LanguageCode? = nil
                                
    /// Appends the specified query terms to the query, as if they were combined with a logical AND operator.
    public var hq: String? = nil
                                
    /// Returns black and white, grayscale, transparent, or color images.
    public var imgColorType: CSEQuery.ImgColorType? = nil
                                                        
    /// Returns images of a specific dominant color.
    public var imgDominantColor: CSEQuery.ImgDominantColor? = nil
                                               
    /// Returns images of a specified size.
    public var imgSize: CSEQuery.ImgSize? = nil
                                               
    /// Returns images of a type.
    public var imgType: CSEQuery.ImgType? = nil
                                      
    /// Specifies that all search results should contain a link to a particular URL.
    public var linkSite: String? = nil
                                    
    /// Restricts the search to documents written in a particular language (e.g., lr=lang_ja).
    public var lr: CSEQuery.LanguageCode? = nil
                              
    /// Number of search results to return - 1 and 10, inclusive.
    public var num: Int? = nil
                               
    /// Provides additional search terms to check for in a document, where each document in the search results must contain at least one of the
	/// additional search terms.
    public var orTerms: String? = nil
                                    
    /// Filters based on licensing.
    public var rights: CSEQuery.Rights? = nil
                                           
    /// Search safety level.
    public var safe: CSEQuery.Safety? = nil
                                        
    /// Specifies the search type and if unspecified, results are limited to webpages.
    public var searchType: CSEQuery.SearchType? = nil
                                                      
    /// Specifies a given site which should always be included or excluded from results
    public var siteSearchFilter: CSEQuery.SearchFilter? = nil
                                  
    /// The sort expression to apply to the results. The sort parameter specifies that the results be sorted according to the specified expression i.e.
	/// sort by date.
    public var sort: String? = nil
                                   
    /// The index of the first result to return. The default number of results per page is 10, so &start=11 would start at the top of the second page of
    /// results. Note: The JSON API will never return more than 100 results, even if more than 100 documents match the query, so setting the sum
    /// of start + num to a number greater than 100 will produce an error. Also note that the maximum value for num is 10.
    public var start: UInt32? = nil
    
    // required
    
    /// Search Engine ID
    public var cx: String?
    
    /// Query
    public var q: String?
    
    /// API Key
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
