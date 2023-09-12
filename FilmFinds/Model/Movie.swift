//
//  Movie.swift
//  FilmFinds
//
//  Created by Yeasir Arefin Tusher on 12/9/23.
//

import Foundation
// MARK: - Result
struct Movie:  Codable{
    var adult: Bool?
    var backdrop_path: String?
    var genre_ids: [Int]?
    var id: Int?
    var original_language: OriginalLanguage?
    var original_title: String?
    var overview: String?
    var popularity: Double?
    var poster_path: String?
    var release_date: String?
    var title: String?
    var video: Bool?
    var vote_average: Double?
    var vote_count: Int?
}

enum OriginalLanguage: String, Codable {
    case en
    case ja
}
