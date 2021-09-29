//
//  UsefulExtension.swift
//  MovieDB
//
//  Created by Munro Azumi on 9/29/21.
//

import Foundation
import UIKit

extension UIView {
    
    func makeRounded() {
        layer.cornerRadius = 5
    }
    
    func addBorder() {
        layer.cornerRadius = 5
        layer.borderWidth = 2.5
        layer.borderColor = UIColor.cyan.cgColor
    }
    
    func removeBorder() {
        layer.borderColor = UIColor.clear.cgColor
    }
}

extension UIImageView {
    func imageFromServerURL(_ URLString: String) {
        let image_url = Constant.IMAGE_BASE_URL.rawValue + URLString
        if let url = URL(string: image_url) {
            URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                DispatchQueue.main.async {
                    if let data = data {
                        if let downloadedImage = UIImage(data: data) {
                            self.image = downloadedImage
                        }
                    }
                }
            }).resume()
        }
    }
}
