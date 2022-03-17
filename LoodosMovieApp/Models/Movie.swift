//
//  Movie.swift
//  LoodosMovieApp
//
//  Created by Büşra on 17.03.2022.
//

import Foundation

struct Movie: Codable {
    let search: [SearchMovie]?
    
    enum CodingKeys: String, CodingKey {
        case search = "Search"
    }
}
// MARK: - SearchMovie
struct SearchMovie: Codable {
    var title, year, rated, released: String?
    var genre: String?
    var actors: String?
    var poster: String?
    var imdbRating, imdbVotes, imdbID: String?

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case rated = "Rated"
        case released = "Released"
        case genre = "Genre"
        case actors = "Actors"
        case poster = "Poster"
        case imdbRating, imdbVotes, imdbID
    }
}
