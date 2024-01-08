//
//  DetailCollectionViewCell.swift
//  ImgurGallerySearch
//
//  Created by Chaudhari, Dipak Bharat (external - Service) on 08/01/24.
//

import UIKit

class DetailCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var cellImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    // MARK: - Static Props
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
    // MARK: - Cell Configuration
    func cellConfiguration(imageLink:String) {
        self.cellImageView.setImage(with: imageLink)
    }
}
