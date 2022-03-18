//
//  NetworkManager.swift
//  LoodosMovieApp
//
//  Created by Büşra on 17.03.2022.
//

import Foundation
import Moya

protocol Networkable {
    var provider: MoyaProvider<API> { get }
    
    func fetchMovieDetail(id: String, completion: @escaping (Result<MovieDetail, Error>) -> ())
    func fetchSearchMovies(title: String,completion: @escaping (Result<Movie, Error>)-> ())
}

class NetworkManager: Networkable {
    var provider = MoyaProvider<API>(plugins: [NetworkLoggerPlugin()])
    
    func fetchMovieDetail(id: String, completion: @escaping (Result<MovieDetail, Error>) -> ()) {
        request(target: .movieDetail(id: id), completion: completion)
    }
    
    func fetchSearchMovies(title: String, completion: @escaping (Result<Movie, Error>) -> ()) {
        request(target: .searchMovie(title: title), completion: completion)
    }
}

private extension NetworkManager {
    private func request<T: Decodable>(target: API, completion: @escaping (Result<T, Error>) -> ()) {
        provider.request(target) { result in
            switch result {
            case let .success(response):
                do {
                    let results = try JSONDecoder().decode(T.self, from: response.data)
                    completion(.success(results))
                } catch let error {
                    completion(.failure(error))
                }
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
