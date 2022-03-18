//
//  AnalyticsHelper.swift
//  LoodosMovieApp
//
//  Created by Büşra on 18.03.2022.
//

import Foundation
import FirebaseAnalytics

class AnalyticsHelper{
    
    static let sharedInstance: AnalyticsHelper = {
        let instance = AnalyticsHelper()
        return instance
    }()
    
    static func movieDetailClicked(moviesNameLabel: String, overviewLabel: String, releaseLabel: String, imdbLabel: String, actorsNameLabel: String, genreLabel: String) {
        Analytics.logEvent("movieDetailClicked", parameters: ["moviesNameLabel" : moviesNameLabel,
                                                          "overviewLabel": overviewLabel,
                                                          "releaseLabel": releaseLabel,
                                                              "imdbLabel" : imdbLabel,
                                                              "actorsNameLabel" : actorsNameLabel,
                                                              "genreLabel" : genreLabel])
    }
}
