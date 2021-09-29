//
//  ViewController.swift
//  MovieDB
//
//  Created by Munro Azumi on 9/24/21.
//

import UIKit

class MovieListViewController: UIViewController {
    
    var movieListModelObj: MovieListModel?
    var filteredMovieList: MovieListModel?
    let apiController = ApiController()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        apiController.delegate = self
        apiController.requestData(url: Constant.MOVIE_LIST_URL.rawValue)
        
        setUpTitleView()
        searchBar.searchTextField.textColor = .white
    }
    
    func setUpTitleView() {
        let title: UILabel = UILabel.init()
        title.text = "MOVIES"
        title.font =  UIFont(name: "KhmerSagnamMN", size: 44)
        title.textColor = UIColor.systemBlue
        title.textAlignment = .center
        navigationItem.titleView = title
        navigationController?.navigationBar.barTintColor = .black
    }
}

//MARK: -

extension MovieListViewController: UITableViewDataSource, UISearchBarDelegate, ApiControllerDelegate {
    
    func receiveDataUpdate(data: MovieListModel) {
        //receive JSON data from ApiController, then make copy into filteredMovieList
        self.movieListModelObj = data
        filteredMovieList = movieListModelObj
        //reload table asynchronously
        DispatchQueue.main.async {
            self.tblView.reloadData()
        }
        //print(data)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredMovieList?.results?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movieCell = tableView.dequeueReusableCell(withIdentifier: "cell") as? MovieTableCell
        if let movie = filteredMovieList?.results?[indexPath.row] {
            movieCell?.setUpCell(movie: movie)
        }
        if let movieCell = movieCell {
            return movieCell
        }
        return UITableViewCell()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let movieList = movieListModelObj?.results
        filteredMovieList?.results?.removeAll()
        for movie in movieList! {
            if movie.title?.localizedCaseInsensitiveContains(searchText) == true {
                filteredMovieList?.results?.append(movie)
            }
        }
        if searchText == "" {
            filteredMovieList = movieListModelObj
        }
        tblView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        self.view.endEditing(true)
        filteredMovieList = movieListModelObj
        tblView.reloadData()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        
        return false
    }
}

// MARK: -

//let imgUrlString = "https://www.themoviedb.org/t/p/original" + (movie?.backdrop_path ?? "")
//if let imgDataUrl = URL(string: imgUrlString) {
//    do {
//        let imgData = try Data(contentsOf: imgDataUrl as URL)
//        movieCell?.movieCellImage.image = UIImage.init(data: imgData)
//    } catch {
//        print("uhoh")
//    }
//}

//Fetch data from url
//        ApiManager.shared.getDataFromUrl(url: Constant.MOVIE_LIST_URL.rawValue) { (objMovieList) in
//            self.movieListModelObj = objMovieList
//            //Update UI from main thread
//            DispatchQueue.main.async {
//                self.tblView.reloadData()
//            }
//        }
