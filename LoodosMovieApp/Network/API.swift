//
//  API.swift
//  LoodosMovieApp
//
//  Created by Büşra on 17.03.2022.
//

import Foundation
import Moya

enum API {
    case movieDetail(id: String)
    case searchMovie(title: String)
    
    static let apiKey = "612d52d5"
}

extension API: TargetType {
    var baseURL: URL {
        guard let url = URL(string: BaseUrl) else { fatalError()}
        return url
    }
    
    var path: String {
        switch self{
        case .movieDetail:
            return ""
        case .searchMovie:
            return ""
        }
    }
    
    var method: Moya.Method {
        switch self{
        case .movieDetail(_), .searchMovie(_):
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .movieDetail(let id):
            return .requestParameters(parameters: ["apikey" : API.apiKey, "i": id], encoding: URLEncoding.queryString)
        case .searchMovie(let title):
            return .requestParameters(parameters: ["apikey" : API.apiKey, "s": title], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
}
