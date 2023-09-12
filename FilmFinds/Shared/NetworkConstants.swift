//
//  NetworkConstants.swift
//  FilmFinds
//
//  Created by Yeasir Arefin Tusher on 12/9/23.
//

import Foundation

class NetworkConstants {
    static var shared = NetworkConstants()
    private init() {}

    var apiKey: String {
        return "5b7b4c91cf8d7dc046a601c265ca766d"
    }

    var baseURL: String {
        return "https://api.themoviedb.org/3/"
    }
    
    var posterImageBaseUrl : String{
        return "https://image.tmdb.org/t/p/w500"
    }
}

