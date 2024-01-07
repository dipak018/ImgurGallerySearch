//
//  UIImageView+Extension.swift
//  ImgurGallerySearch
//
//  Created by Chaudhari, Dipak Bharat (external - Service) on 06/01/24.
//

import UIKit
import SDWebImage

extension UIImageView {
    func setImage(with urlString: String) {
        guard let imageURL = URL.init(string: urlString) else {
            return
        }
        self.sd_imageIndicator = SDWebImageActivityIndicator.gray
        self.sd_imageIndicator?.startAnimatingIndicator()
        self.sd_setImage(with: imageURL, placeholderImage: UIImage(named: "emptyImage.png"), options:.continueInBackground) { (image, error, cacheType, url) in
            if error != nil {
                self.image = UIImage(named: "No_Image_found")
                self.contentMode = .scaleAspectFit
                self.backgroundColor = .white
            }
        }
        
    }
}

