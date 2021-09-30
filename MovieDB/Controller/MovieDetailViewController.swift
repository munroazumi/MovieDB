//
//  MovieDetailViewController.swift
//  MovieDB
//
//  Created by Munro Azumi on 9/30/21.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    var movie: Movie?

    @IBOutlet weak var detailImgView: UIImageView!
    @IBOutlet weak var detailTitle: UILabel!
    @IBOutlet weak var detailOriginalTitle: UILabel!
    @IBOutlet weak var detailReleaseDate: UILabel!
    @IBOutlet weak var detailPopularity: UILabel!
    @IBOutlet weak var detailID: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpTitleView()
        detailImgView.imageFromServerURL(movie?.backdrop_path ?? "")
        detailTitle.text = movie?.title?.uppercased()
        detailOriginalTitle.text = movie?.original_title
        detailReleaseDate.text = movie?.release_date
        detailPopularity.text = "\(movie?.popularity ?? 0)"
        detailID.text = "\(movie?.id ?? 0)"
    }
    
    func setUpTitleView() {
        let title: UILabel = UILabel.init()
        title.text = "DETAILS"
        title.font =  UIFont(name: "KhmerSagnamMN", size: 44)
        title.textColor = UIColor(rgb: 0x68FBCF)
        title.textAlignment = .center
        navigationItem.titleView = title
    }
}
