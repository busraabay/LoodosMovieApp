//
//  Movie.swift
//  LoodosMovieApp
//
//  Created by Büşra on 17.03.2022.
//

import Foundation

struct Movie: Codable {
    var search: [SearchMovie]?
    
    enum CodingKeys: String, CodingKey {
        case search = "Search"
    }
}
// MARK: - SearchMovie
struct SearchMovie: Codable {
    var title, year, rated, released: String?
    var type: String?
    var poster: String?
    var imdbRating, imdbVotes, imdbID: String?

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case rated = "Rated"
        case released = "Released"
        case type = "Type"
        case poster = "Poster"
        case imdbRating, imdbVotes, imdbID
    }
}
