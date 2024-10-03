//
//  LanguageCode.swift
//  CSEKit
//
//  Created by Christian Norton on 9/30/24.
//

public extension CSEQuery {
    enum LanguageCode: String, Codable, Sendable {
        case ar = "lang_ar"
        case bg = "lang_bg"
        case ca = "lang_ca"
        case cs = "lang_cs"
        case da = "lang_da"
        case de = "lang_de"
        case el = "lang_el"
        case en = "lang_en"
        case es = "lang_es"
        case et = "lang_et"
        case fi = "lang_fi"
        case fr = "lang_fr"
        case hr = "lang_hr"
        case hu = "lang_hu"
        case id = "lang_id"
        case `is` = "lang_is"
        case it = "lang_it"
        case iw = "lang_iw"
        case ja = "lang_ja"
        case ko = "lang_ko"
        case lt = "lang_lt"
        case lv = "lang_lv"
        case nl = "lang_nl"
        case pl = "lang_pl"
        case pt = "lang_pt"
        case ro = "lang_ro"
        case ru = "lang_ru"
        case sk = "lang_sk"
        case sl = "lang_sl"
        case sr = "lang_sr"
        case sw = "lang_sw"
        case tr = "lang_tr"
        case zh = "lang_zh"
        case zh_cn = "lang_zh-CN"
        case zh_tw = "lang_zh-TW"
        
        private static let allowed: Set<LangCode> = [
            .ar, .bg, .ca, .cs, .da, .de, .el, .en, .es, .et, .fi, .fr,
            .hr, .hu, .id, .is, .it, .iw, .ja, .ko, .lt, .lv, .nl, .pl,
            .pt, .ro, .ru, .sk, .sl, .sr, .sw, .tr, .zh, .zh_cn, .zh_tw
        ]
        
        // Function to return a language code based on the country code
        public static func from(countryCode: LangCode) -> LanguageCode? {
            guard allowed.contains(countryCode) else { return nil }
            let rawCode = "lang_" + countryCode.rawValue.replacingOccurrences(of: "-", with: "_")
            return LanguageCode(rawValue: rawCode)
        }
    }
}

