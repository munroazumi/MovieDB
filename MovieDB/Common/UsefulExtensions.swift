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
        layer.borderColor = UIColor(rgb: 0x68FBCF).cgColor
    }
    
    func removeBorder() {
        layer.borderColor = UIColor.clear.cgColor
    }
}

extension UIImageView {
    func imageFromServerURL(_ URLString: String) {
        let image_url = Constant.IMAGE_BASE_URL.rawValue + URLString
        if let url = URL(string: image_url) {
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: url) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
                DispatchQueue.main.async {
                    self.image = UIImage(data: data!)
                }
            }
        }
    }
}

extension UIColor {
   convenience init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")

       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
   }

   convenience init(rgb: Int) {
       self.init(
           red: (rgb >> 16) & 0xFF,
           green: (rgb >> 8) & 0xFF,
           blue: rgb & 0xFF
       )
   }
}
