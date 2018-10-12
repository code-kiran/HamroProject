//
//  ImageCacheExtension.swift
//  HamroProject
//
//  Created by kiran on 10/12/18.
//  Copyright © 2018 kiran. All rights reserved.
//

import Foundation
import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()
extension UIImageView {
    func downloadImages(url: String) {
        let url = URL(string: url)
        //it check the image in the cache firest
        image = nil
        if let imagesFromCache = imageCache.object(forKey: url as AnyObject) as? UIImage {
            self.image = imagesFromCache
            return
        }
        //it downloads the image if there is no image in cachź
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                print(error!)
                return
            }
            DispatchQueue.main.sync {
                if let imageToCache = UIImage(data: data!) {
                    imageCache.setObject(imageToCache, forKey: url as AnyObject)
                    self.image = imageToCache
                }
            }
            }.resume()
    }
}

extension String {
    func date(format: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = TimeZone.current
        let date = dateFormatter.date(from: self)
        return date
    }
}
