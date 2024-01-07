//
//  IGSBaseCollectionViewCell.swift
//  ImgurGallerySearch
//
//  Created by Chaudhari, Dipak Bharat (external - Service) on 06/01/24.
//

import UIKit

class IGSBaseCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Static Props
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
