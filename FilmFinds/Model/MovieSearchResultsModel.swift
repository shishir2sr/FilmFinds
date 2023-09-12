//
//  MovieSearchResultsModel.swift
//  FilmFinds
//
//  Created by Yeasir Arefin Tusher on 12/9/23.
//

import Foundation


// MARK: - Welcome
struct MovieSearchResultsModel {
    var page: Int?
    var results: [Movie]?
    var totalPages: Int?
    var totalResults: Int?
}
