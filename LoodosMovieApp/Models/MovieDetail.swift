//
//  MovieDetail.swift
//  LoodosMovieApp
//
//  Created by Büşra on 17.03.2022.
//

import Foundation

// MARK: - MovieDetail
struct MovieDetail: Codable {
    var title, year, rated, released: String?
    var runtime, genre, director, writer: String?
    var actors, plot, language, country: String?
    var awards: String?
    var poster: String?
    var metascore, imdbRating, imdbVotes, imdbID: String?
    var type, production: String?
    var website, response: String?

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case rated = "Rated"
        case released = "Released"
        case runtime = "Runtime"
        case genre = "Genre"
        case director = "Director"
        case writer = "Writer"
        case actors = "Actors"
        case plot = "Plot"
        case language = "Language"
        case country = "Country"
        case awards = "Awards"
        case poster = "Poster"
        case metascore = "Metascore"
        case imdbRating, imdbVotes, imdbID
        case type = "Type"
        case production = "Production"
        case website = "Website"
        case response = "Response"
    }
}
