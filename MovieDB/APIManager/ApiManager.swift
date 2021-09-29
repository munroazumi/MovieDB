//
//  ApiManager.swift
//  MovieDB
//
//  Created by Munro Azumi on 9/27/21.
//

import UIKit

class ApiManager {
    
    //Declare static object for ApiManager so that it can be accessed globally
    static let shared = ApiManager()
    
    //function that takes URL parameter and creates closure to pass MovieListModel (to VC)
    func getDataFromUrl(url: String, completionHandler: @escaping ((MovieListModel?) -> ())) {
        
        //create URL session
        let urlSession = URLSession.shared
        //start task - retrieve JSON from URL then do task
        urlSession.dataTask(with: URL.init(string: url)!) { data, response, error in
            
            //if let (guard let) used just in case data isn't retrieved
            if let apiData = data {
            
                //create JSONDecoder and format data from url into MovieListModel
                let jsonDecoder =  JSONDecoder()
                let movieList = try? jsonDecoder.decode(MovieListModel.self, from: apiData)
                
            
                completionHandler(movieList)
            }
        } .resume()
        
    }
}

