//
//  Loading.swift
//  LoodosMovieApp
//
//  Created by Büşra on 17.03.2022.
//

import Foundation
import UIKit
import MaterialComponents

struct Loading {
    static let shared = Loading()
    
    private let activityIndicator = MDCActivityIndicator()

    private init() { }
    
    func show(in view: UIView) {
        activityIndicator.removeFromSuperview() // If sequential calls are made, avoid stacking indicators upon each other
        
        let size: CGFloat = 80
        activityIndicator.frame = .init(x: 0, y: 0, width: size, height: size)
        activityIndicator.center = view.center
        activityIndicator.cycleColors = [.gray]
        
        view.addSubview(activityIndicator)
        view.bringSubviewToFront(activityIndicator)
        
        activityIndicator.startAnimating()
    }
    
    func hide() {
        activityIndicator.removeFromSuperview()
        activityIndicator.stopAnimating()
    }
}
