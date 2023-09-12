//
//  EndPoint.swift
//  FilmFinds
//
//  Created by Yeasir Arefin Tusher on 12/9/23.
//

import Foundation

class EndPoint {
    let baseURL = NetworkConstants.shared.baseURL
    let apiKey: String = NetworkConstants.shared.apiKey
    static let shared = EndPoint()

    private init() {}

    // MARK: Build diferent query parameters
    enum QueryParameter {
        case search(String)
        case page(Int)
        var queryItem: URLQueryItem {
            switch self {
            case .search(let query):
                return URLQueryItem(name: "query", value: query)
            case .page(let pageNo):
                return URLQueryItem(name: "page", value: "\(pageNo)")
            }
        }
    }

    // MARK: create URL
    private func createURL(endpoint: String, queryParameters: [QueryParameter]) -> URL? {
        var components = URLComponents(string: baseURL + endpoint)
        components?.queryItems = queryParameters.map { $0.queryItem }
        components?.queryItems?.append(URLQueryItem(name: "api_key", value: apiKey))
        return components?.url
    }
    
    /**
         Returns a URL for searching movies.
         
         - Parameters:
            - queryParameters: An optional array of `QueryParameter` objects to include in the URL.
         
         - Returns: A URL object for searching movies.
         */
    func searchMovie(with queryParameters: [QueryParameter] = []) -> URL? {
        let endpoint = "search/movie"
        return createURL(endpoint: endpoint, queryParameters: queryParameters)
    }
    
    /**
         Returns a URL for discovering movies.
         - Returns: A URL object for searching movies.
         */
    func discoverMovie(with queryParameters: [QueryParameter] = []) -> URL? {
        let endpoint = "discover/movie"
        return createURL(endpoint: endpoint, queryParameters: [])
        
        
        
        
        
        
        
        
    }

}
