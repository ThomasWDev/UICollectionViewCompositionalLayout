//
//  MTDashboardVM.swift
//  MovieTask
//
//  Created by Thomas Woodfin on 2/28/21.
//

import Foundation
import SVProgressHUD


class MTDashboardVM{
    
    private var movieList: [MovieResponse]?

    
    func getMovieList(completion: @escaping (_ success: Bool) -> Void){
        SVProgressHUD.show()
        APIClient.shared.objectAPICall(apiEndPoint: DashboardEndPoint.getMovieList, modelType: [MovieResponse].self) { (response) in
            switch response {
            case .success(let value):
                SVProgressHUD.dismiss()
                self.movieList = value
                completion(true)
            case .failure((let code, let data, let err)):
                SVProgressHUD.dismiss()
                DLog("code = \(code)")
                DLog("data = \(String(describing: data))")
                DLog("error = \(err.localizedDescription)")
                completion(false)
            }
        }
    }
    
    
    func getMovideList()->[MovieResponse]{
        guard let list = movieList else {return [MovieResponse]()}
        return list
    }
    
    func getTitleId(index: Int)->Int{
        guard let titleId = movieList?[index].titleId else {return 0}
        return titleId
    }
    
    func getTitle(index: Int)->String{
        guard let title = movieList?[index].title else {return ""}
        return title
    }
    
    func getArtistName(index: Int)->String{
        guard let artistName = movieList?[index].artistName else {return ""}
        return artistName
    }
    
    func getArtKey(index: Int)->String{
        guard let artKey = movieList?[index].artKey else {return ""}
        return artKey
    }
    
    func getPopularityRank(index: Int)->Int{
        guard let popularityRank = movieList?[index].popularityRank else {return 0}
        return popularityRank
    }
    
}





