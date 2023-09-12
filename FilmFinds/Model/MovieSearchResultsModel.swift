//
//  MovieSearchResultsModel.swift
//  FilmFinds
//
//  Created by Yeasir Arefin Tusher on 12/9/23.
//

import Foundation


// MARK: - MovieSearchResultsModel
struct MovieSearchResultsModel: Codable {
    var page: Int?
    var results: [Movie]?
    var total_pages: Int?
    var total_results: Int?
}
