//
//  APIError.swift
//  MovieTask
//
//  Created by Thomas Woodfin on 4/7/20.
//  Copyright © 2020 Thomas Woodfin. All rights reserved.
//

import Foundation


enum APIError: Int {
    case unauthorized   = 401
    case notFound       = 404
    case timeOut        = 408
    case preconditioned = 412
    case invalidParam   = 422
    case dependencyFail = 424
    case serverProblem  = 500
    case sessionExpired = 440
}
