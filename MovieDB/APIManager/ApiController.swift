//
//  ApiDelegateProtocol.swift
//  MovieDB
//
//  Created by Munro Azumi on 9/28/21.
//

import UIKit

protocol ApiControllerDelegate {
    func receiveDataUpdate(data: MovieListModel)
}

class ApiController {
    
    var delegate: ApiControllerDelegate?
    
    func requestData(url: String) {
        let urlSession = URLSession.shared
        urlSession.dataTask(with: URL.init(string: url)!) { data, response, error in
            
            guard let apiData = data else {return}
            
            let jsonDecoder =  JSONDecoder()
            let movieList = try? jsonDecoder.decode(MovieListModel.self, from: apiData)
            
            self.delegate?.receiveDataUpdate(data: movieList!)
        }
        .resume()
    }

}
