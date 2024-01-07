//
//  IGSBaseCollectionViewCell.swift
//  ImgurGallerySearch
//
//  Created by Chaudhari, Dipak Bharat (external - Service) on 06/01/24.
//

import UIKit

class IGSBaseCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Public Props
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var createdTimeLabel: UILabel!
    @IBOutlet weak var numberOfImagesLabel: UILabel!
    @IBOutlet weak var cellImageView: UIImageView!

    // MARK: - Property Observer
    var albumEntity:AlbumEntity? {
        didSet {
            cellConfiguration()
        }
    }
   
    // MARK: - Static Props
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.cellImageView.image = UIImage(named:"emptyImage")
    }
    
   
    // MARK: - Cell Configurator
    func cellConfiguration() {
        guard let albumEntity else { return }
        
        // Setting album title
        if let title = albumEntity.title {
            self.titleLabel.text = title
        }
        
        // Setting entity creation date
        if let datetime = albumEntity.datetime {
            if let d = Date().getTime(timestamp: datetime) {
                self.createdTimeLabel.text = d
            }
        }
        
        // Settting the count if the cell contains more than 1 images
        if let images_count = albumEntity.images_count {
            if images_count > 1 {
                self.numberOfImagesLabel.isHidden = false
                self.numberOfImagesLabel.text = "+\(String(images_count-1))"
            }
        }
        
        // Finding first entity having valid image url
        let entity = albumEntity.images?.first(where: { $0.type?.contains("image") ?? false })
        if let urlLink = entity?.link {
            self.cellImageView.setImage(with: urlLink)
        } else {
            self.cellImageView.image = UIImage(named: "No_Image_found")
        }
    }
}

