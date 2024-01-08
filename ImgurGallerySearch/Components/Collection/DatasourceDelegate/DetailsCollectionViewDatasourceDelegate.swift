//
//  DetailsCollectionViewDatasourceDelegate.swift
//  ImgurGallerySearch
//
//  Created by Chaudhari, Dipak Bharat (external - Service) on 08/01/24.
//

import UIKit

class DetailsCollectionViewDatasourceDelegate: NSObject {
    var albumEntity:AlbumEntity!
}

// MARK: - UICollectionViewDataSource
extension DetailsCollectionViewDatasourceDelegate: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let imagesCount = albumEntity.images?.count {
            return imagesCount
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return  self.gridCell(collectionView, cellForItemAt: indexPath)
    }
}

// MARK: - UICollectionViewDelegate
extension DetailsCollectionViewDatasourceDelegate: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {}
}

extension DetailsCollectionViewDatasourceDelegate {
    func gridCell(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> DetailCollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailCollectionViewCell.reuseIdentifier, for: indexPath) as! DetailCollectionViewCell
        
        if let imageEntity = self.albumEntity.images?[indexPath.row] {
            if let linkString = imageEntity.link {
                cell.cellConfiguration(imageLink: linkString)
            }
        }
            
        
        return cell
    }
}
