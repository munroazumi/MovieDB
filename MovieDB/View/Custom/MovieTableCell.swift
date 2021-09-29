//
//  MovieTableCell.swift
//  MovieDB
//
//  Created by Munro Azumi on 9/24/21.
//

import UIKit

class MovieTableCell: UITableViewCell {
    
    @IBOutlet weak var movieCellImage: UIImageView!
    @IBOutlet weak var movieCellTitle: UILabel!
    @IBOutlet weak var movieCellPopularity: UILabel!
    @IBOutlet weak var movieCellReleaseDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUpCell(movie: Movie) {
        movieCellImage.imageFromServerURL(movie.backdrop_path ?? "")
        movieCellTitle.text = movie.title ?? ""
        movieCellReleaseDate.text = movie.release_date ?? ""
        movieCellPopularity.text = "\(movie.popularity ?? 0)"
    }

}
