//
//  ListCollectionViewCell.swift
//  ImgurGallerySearch
//
//  Created by Chaudhari, Dipak Bharat (external - Service) on 06/01/24.
//

import UIKit

class ListCollectionViewCell: IGSBaseCollectionViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 10
        self.cellImageView.layer.cornerRadius = 10
        self.numberOfImagesLabel.layer.cornerRadius = 5
        self.numberOfImagesLabel.layer.masksToBounds = true
    }
}
