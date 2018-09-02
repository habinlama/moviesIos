//
//  PopularService.swift
//  Movies
//
//  Created by MacBookPro on 15/8/18.
//  Copyright © 2018 MacBookPro. All rights reserved.
//

import Foundation
import Alamofire

class PopularService {
    
    static let shared = PopularService()
    private init() {}
    
    func fetchPopularMovieList(url: String, method: HTTPMethod, parameters: [String: Any]?, completion: @escaping (PopularList) -> ()) {
        
        sessionManager.request(url, method: method, parameters: parameters, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            
            if let err = response.error {
                print("Fetching Json Result: ", err)
                return
            }
            
            guard let data = response.data else { return }
            do {
                let searchResult = try JSONDecoder().decode(PopularList.self, from: data)
                //print(searchResult)
                completion(searchResult)
            } catch let decodeErr {
                print("Failed to decode: ", decodeErr)
            }
        }
        
    }
    
}
