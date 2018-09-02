//
//  HomePageService.swift
//  Movies
//
//  Created by MacBookPro on 15/8/18.
//  Copyright © 2018 MacBookPro. All rights reserved.
//

import Foundation
import Alamofire

class HomePageService {
    
    static let shared = HomePageService()
    private init() {}

    func fetchHomeMovieList(url: String, method: HTTPMethod, parameters: [String: Any]?, completion: @escaping (MovieList) -> ()) {
        
        sessionManager.request(url, method: method, parameters: parameters, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            
            if let err = response.error {
                print("Fetching Json Result: ", err)
                return
            }
            
            guard let data = response.data else { return }
            do {
                let searchResult = try JSONDecoder().decode(MovieList.self, from: data)
                //print(searchResult)
                completion(searchResult)
            } catch let decodeErr {
                print("Failed to decode: ", decodeErr)
            }
        }
        
    }
    
}
