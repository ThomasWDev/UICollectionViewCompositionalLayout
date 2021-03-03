//
//  URLPaths.swift
//  MovieTask
//
//  Created by Thomas Woodfin on 4/7/20.
//  Copyright © 2020 Thomas Woodfin. All rights reserved.
//

import Foundation



#if DEVELOPMENT
let KBasePath = "https://hoopla-ws.hoopladigital.com"
#else
let KBasePath = "https://hoopla-ws.hoopladigital.com"
#endif

enum OauthPath: String {
    case getMovideList              = "/kinds/7/titles/top"
    case getMovideDetails           = "/titles/"
}
