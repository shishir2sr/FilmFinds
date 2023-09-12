//
//  Movie.swift
//  FilmFinds
//
//  Created by Yeasir Arefin Tusher on 12/9/23.
//

import Foundation
// MARK: - Result
struct Movie {
    var adult: Bool?
    var backdropPath: String?
    var genreids: [Int]?
    var id: Int?
    var originalLanguage: OriginalLanguage?
    var originalTitle: String?
    var overview: String?
    var popularity: Double?
    var posterPath: String?
    var releaseDate: String?
    var title: String?
    var video: Bool?
    var voteAverage: Double?
    var voteCount: Int?
}

enum OriginalLanguage: String {
    case en
    case ja
}
