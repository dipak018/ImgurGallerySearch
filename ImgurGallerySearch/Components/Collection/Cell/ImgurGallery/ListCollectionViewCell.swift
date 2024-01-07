//
//  ListCollectionViewCell.swift
//  ImgurGallerySearch
//
//  Created by Chaudhari, Dipak Bharat (external - Service) on 06/01/24.
//

import UIKit

class ListCollectionViewCell: IGSBaseCollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var cellImageView: UIImageView!
    
    var albumEntity:AlbumEntity? {
        didSet { // Property Observer
            cellConfiguration()
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.cellImageView.image = UIImage(named:"emptyImage")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 10
        self.cellImageView.layer.cornerRadius = 10
    }
}

extension ListCollectionViewCell {
    func cellConfiguration() {
        guard let albumEntity else { return }
        if let title = albumEntity.title {
            self.titleLabel.text = title
        }
        if let imageLink = albumEntity.images?.first?.link {
            self.cellImageView.setImage(with: imageLink)
        } else {
            self.cellImageView.image = UIImage(named: "No_Image_found")
        }
    }
}
