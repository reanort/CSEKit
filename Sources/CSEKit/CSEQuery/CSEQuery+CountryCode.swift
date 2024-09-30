//
//  CountryCode.swift
//  CSEKit
//
//  Created by Christian Norton on 9/30/24.
//

public extension CSEQuery {
    enum CountryCode: String, Codable, Sendable {
        case zu
        case af
        case sq
        case sm
        case ar
        case az
        case eu
        case be
        case bn
        case bh
        case bs
        case bg
        case ca
        case zh
        case zh_cn
        case zh_tw
        case hr
        case cs
        case da
        case nl
        case en
        case eo
        case et
        case fo
        case fi
        case fr
        case fy
        case gl
        case ka
        case de
        case el
        case gu
        case iw
        case hi
        case hu
        case `is`
        case id
        case ia
        case ga
        case it
        case ja
        case jw
        case kn
        case ko
        case la
        case lv
        case lt
        case mk
        case ms
        case ml
        case mt
        case mr
        case ne
        case no
        case nn
        case oc
        case fa
        case pl
        case pt
        case pt_br
        case pt_pt
        case pa
        case ro
        case ru
        case gd
        case sr
        case si
        case sk
        case sl
        case es
        case su
        case sw
        case sv
        case tl
        case ta
        case te
        case th
        case ti
        case tr
        case uk
        case ur
        case uz
        case vi
        case cy
        case xh
        
        public enum PtCodingKeys: String, CodingKey {
            case _br = "pt-BR"
            case _pt = "pt-PT"
        }
        public enum ZhCodingKeys: String, CodingKey {
            case _cn = "zh-CN"
            case _tw = "zh-TW"
        }
        public enum CodingKeys: String, CodingKey {
            case zh = "zh-CN"
        }
        
    }
}
