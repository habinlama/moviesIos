//
//  ApiEndPoints.swift
//  Movies
//
//  Created by MacBookPro on 15/8/18.
//  Copyright © 2018 MacBookPro. All rights reserved.
//

import Foundation

struct ApiEndPoints {
    static func getHomeMovies(page: Int) -> String {
        return "https://api.themoviedb.org/3/movie/now_playing?api_key=a3eef94fad01d4268033271b284e23f4&language=en-US&page=\(page)"
    }
    
    static func getSearchMovies(searchWord: String, searchPage: Int) -> String {
        return "https://api.themoviedb.org/3/search/movie?api_key=a3eef94fad01d4268033271b284e23f4&language=en-US&query=\(searchWord)&page=\(searchPage)&include_adult=false"
    }
    
    static func getPopularMovies(popularPage: Int) -> String {
        return "https://api.themoviedb.org/3/discover/movie?api_key=a3eef94fad01d4268033271b284e23f4&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=\(popularPage)"
    }
}
