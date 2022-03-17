//
//  SearchTableViewCell.swift
//  LoodosMovieApp
//
//  Created by Büşra on 17.03.2022.
//

import UIKit
import Kingfisher

class SearchTableViewCell: UITableViewCell {

    static let identifier = "SearchTableViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "SearchTableViewCell", bundle: nil)
    }
 
    @IBOutlet weak var moviesNameLabel: UILabel!
    @IBOutlet weak var moviesImageView: UIImageView!
    @IBOutlet weak var releaseLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCell(search: SearchMovie) {
        moviesNameLabel.text = search.title?.uppercased()
        moviesImageView.kf.setImage(with: URL(string: search.poster ?? ""))
        typeLabel.text = search.type?.uppercased()
        releaseLabel.text = search.year
    }
}
