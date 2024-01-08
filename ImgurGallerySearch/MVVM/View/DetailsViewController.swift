//
//  DetailsViewController.swift
//  ImgurGallerySearch
//
//  Created by Chaudhari, Dipak Bharat (external - Service) on 08/01/24.
//

import UIKit

class DetailsViewController: IGSBaseViewController {

    // MARK: - IBOutlets. Public Props
    @IBOutlet weak var collectionView: UICollectionView!
    var detailsViewModel:DetailsViewModel!
    
    // MARK: -  Private Props
    private lazy var collectionViewDatasourceDelegate = DetailsCollectionViewDatasourceDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuration()
    }
}

// MARK: - Private

private extension DetailsViewController {
    func configuration() {
        setupCollectionView()
    }
    
    // CollectionView setup
    func setupCollectionView() {
        self.collectionView.backgroundColor = .clear
        self.collectionView.dataSource = collectionViewDatasourceDelegate
        self.collectionView.delegate = collectionViewDatasourceDelegate
        
        if (self.detailsViewModel != nil) {
            self.collectionViewDatasourceDelegate.albumEntity = self.detailsViewModel.albumEntity
            if let title = self.detailsViewModel.albumEntity.title {
                self.title = title
            }
            self.collectionView.reloadData()
        }
        self.collectionView.collectionViewLayout = self.createGridLayout()
        collectionView.register(cell: DetailCollectionViewCell.reuseIdentifier)
    }
    
    // Function to create the layout for Grid collection
    func createGridLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: (collectionView.bounds.width - 30) / 2, height: 120)
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10)
        return layout
    }
}
