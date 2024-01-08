//
//  HomeCollectionViewDatasourceDelegate.swift
//  ImgurGallerySearch
//
//  Created by Chaudhari, Dipak Bharat (external - Service) on 06/01/24.
//

import UIKit

class HomeCollectionViewDatasourceDelegate: NSObject {
    // MARK: - Public Props
    var isListLayout: Bool = false
    var albumEntityArray: [AlbumEntity] = []
    var delegate:HomeViewControllerDelegate!
}

// MARK: - UICollectionViewDataSource
extension HomeCollectionViewDatasourceDelegate: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return albumEntityArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if isListLayout {
            return self.listCell(collectionView, cellForItemAt: indexPath)
        } else {
            return  self.gridCell(collectionView, cellForItemAt: indexPath)
        }
    }
}

// MARK: - UICollectionViewDelegate
extension HomeCollectionViewDatasourceDelegate: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let delegate = self.delegate {
            delegate.homeCollectionView(didSelectItemAt: indexPath)
        }
    }
}

extension HomeCollectionViewDatasourceDelegate {
    func gridCell(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> GridCollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GridCollectionViewCell.reuseIdentifier, for: indexPath) as! GridCollectionViewCell
        cell.albumEntity = albumEntityArray[indexPath.row]
        return cell
    }
    func listCell(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> ListCollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListCollectionViewCell.reuseIdentifier, for: indexPath) as! ListCollectionViewCell
        cell.albumEntity = albumEntityArray[indexPath.row]
        return cell
    }
}
