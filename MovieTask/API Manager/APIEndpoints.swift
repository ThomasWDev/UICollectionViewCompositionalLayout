//
//  APIEndpoints.swift
//  MovieTask
//
//  Created by Thomas Woodfin on 4/7/20.
//  Copyright © 2020 Thomas Woodfin. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


//MARK:- Login
enum DashboardEndPoint: Endpoint {
    
    case getMovieList
    case getMovieDetails(titleId: Int)
    
    var method: HTTPMethod {
        switch self {
        case .getMovieList, .getMovieDetails:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .getMovieList:
            return KBasePath + OauthPath.getMovideList.rawValue
        case .getMovieDetails(let titleId):
            return KBasePath + OauthPath.getMovideDetails.rawValue + String(titleId)
        }
    }
    
    var query: [String: Any]  {
        switch self {
        case .getMovieList, .getMovieDetails:
            return [String: Any]()
        }
    }
}
