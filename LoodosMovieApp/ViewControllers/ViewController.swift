//
//  ViewController.swift
//  LoodosMovieApp
//
//  Created by Büşra on 17.03.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var searchTableView: UITableView!
    
    var networkManager = NetworkManager()
    var searchMovie: Movie?
    var movie: SearchMovie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchTableView.register(SearchTableViewCell.nib(), forCellReuseIdentifier: SearchTableViewCell.identifier)
        searchTableView.delegate = self
        searchTableView.dataSource = self
        
//        loadSearchMovies(title: "spider")
        
        searchBar.delegate = self
        searchBar.placeholder = "Search Movie"
    }

    func loadSearchMovies(title: String) {
        Loading.shared.show(in: self.view)
        networkManager.fetchSearchMovies(title: title) { [weak self] result in
            guard let strongSelf = self else { return }
            switch result {
            case .success(let response):
                strongSelf.searchMovie = response
                strongSelf.searchTableView.reloadData()
                Loading.shared.hide()
            case .failure(let error):
                Loading.shared.hide()
                print(error.localizedDescription)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchMovie?.search?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.identifier, for: indexPath) as? SearchTableViewCell {
            if let movieName = searchMovie?.search?[indexPath.row]{
                cell.configureCell(search: movieName)
            }
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedMovie = searchMovie?.search?[indexPath.row]
        let storyboard = UIStoryboard(name: "Detail", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        vc.modalPresentationStyle = .fullScreen
        vc.id = selectedMovie?.imdbID
        show(vc, sender: nil)
    }
}

//MARK: - SearchBar Delegate
extension ViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
         searchBar.endEditing(true)
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard let query = searchBar.text else { return }
        loadSearchMovies(title: query)

        DispatchQueue.main.async {
            self.searchTableView.reloadData()
        }
    }
}

