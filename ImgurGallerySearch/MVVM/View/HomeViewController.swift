//
//  ViewController.swift
//  ImgurGallerySearch
//
//  Created by Chaudhari, Dipak Bharat (external - Service) on 06/01/24.
//

import UIKit

// HomeViewController

class HomeViewController: UIViewController {

    // MARK: - IBOutlets. Public Props, Private Props

    private lazy var homeVM = HomeViewModel()
}

// MARK: - View Lifecycle

extension HomeViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchImages()
    }
    
}

// MARK: - Private

extension HomeViewController {
    
    func fetchImages() {
        homeVM.fetchTopImagesFromImgurGallery(searchTopic: "dogs")
        
        
        
        
//        APIManager.shared.getTopImages(searchTopic: "dogs") { result in
//            switch result {
//            case .success(let galleryData):
//                print(galleryData)
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
    }
    
}

