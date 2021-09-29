//
//  MovieListModel.swift
//  MovieDB
//
//  Created by Munro Azumi on 9/24/21.
//

import UIKit

struct MovieListModel: Codable {
    var results: [Movie]?
}

struct Movie: Codable {
    var backdrop_path: String?
    var id: Int?
    var original_title: String?
    var popularity: Double?
    var release_date: String?
    var title: String?
    
}
