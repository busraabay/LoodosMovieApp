//
//  DetailViewController.swift
//  LoodosMovieApp
//
//  Created by Büşra on 17.03.2022.
//

import UIKit
import FirebaseAnalytics

class DetailViewController: UIViewController {
    
    @IBOutlet weak var moviesImageView: UIImageView!
    @IBOutlet weak var moviesNameLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var imdbLabel: UILabel!
    @IBOutlet weak var releaseLabel: UILabel!
    @IBOutlet weak var actorsNameLabel: UILabel!
    @IBOutlet weak var awardsLabel: UILabel!
    
    let networkManager = NetworkManager()
    var movieDetail: MovieDetail?
    var id: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let id = id {
            loadMovieDetail(id: id)
        }
    }

    func loadMovieDetail(id: String){
        Loading.shared.show(in: view)
        networkManager.fetchMovieDetail(id: id) { [weak self] result
            in
            guard let strongSelf = self else { return }
            switch result{
            case .success(let response):
                strongSelf.movieDetail = response
                strongSelf.moviesNameLabel.text = self?.movieDetail?.title
                strongSelf.overviewLabel.text = self?.movieDetail?.plot
                strongSelf.moviesImageView.kf.setImage(with: URL(string: self?.movieDetail?.poster ?? ""))
                strongSelf.releaseLabel.text = self?.movieDetail?.released
                strongSelf.imdbLabel.text = self?.movieDetail?.imdbRating
                strongSelf.awardsLabel.text = self?.movieDetail?.awards
                strongSelf.actorsNameLabel.text = self?.movieDetail?.actors
                strongSelf.genreLabel.text = self?.movieDetail?.genre
                Loading.shared.hide()
            case .failure(let error):
                print(error.localizedDescription)
                Loading.shared.hide()
            }
        }
    }

}
