//
//  Endpoint.swift
//  MovieTask
//
//  Created by Thomas Woodfin on 4/7/20.
//  Copyright © 2020 Thomas Woodfin. All rights reserved.
//

import Foundation
import Alamofire

/**
 *  Protocol for all endpoints to conform to.
 */
protocol Endpoint {
    var method: HTTPMethod { get }
    var path: String { get }
    var query: [String: Any] { get }
    var encoding: ParameterEncoding { get }
}

extension Endpoint {
    var encoding: ParameterEncoding { get{return URLEncoding.default} set {} }
}
