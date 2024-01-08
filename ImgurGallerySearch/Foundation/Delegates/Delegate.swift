//
//  Delegate.swift
//  ImgurGallerySearch
//
//  Created by Chaudhari, Dipak Bharat (external - Service) on 08/01/24.
//

import Foundation

// MARK: - HomeViewController delegate
protocol HomeViewControllerDelegate: AnyObject {
    func homeCollectionView(didSelectItemAt selectedIndexPath: IndexPath)
}
