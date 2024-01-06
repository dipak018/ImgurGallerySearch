//
//  HomeViewModel.swift
//  ImgurGallerySearch
//
//  Created by Chaudhari, Dipak Bharat (external - Service) on 06/01/24.
//

import Foundation

class HomeViewModel {
    
    // MARK: - Public Props
    var galleryData:GalleryDataEntity!
    var eventHandler: ((_ event: Event) -> Void)? // Data Binding Closure
    
    // MARK: - Private Props
    
}

// MARK: - Public

extension HomeViewModel {
    
    // Function to get images for the search topic from Imgur API
    func fetchTopImagesFromImgurGallery(searchTopic: String) {
        self.eventHandler?(.loading)
        APIManager.shared.request(inputString: searchTopic,modelType: GalleryDataEntity.self,
                                  type: ImgurGalleryEndpoint.imgurGallery) { response in
            self.eventHandler?(.stopLoading)
            switch response {
            case .success(let galleryDataEntity):
                self.galleryData = galleryDataEntity
                self.eventHandler?(.dataLoaded)
            case .failure(let error):
                self.eventHandler?(.error(error))
            }
        }
    }
}

// MARK: - Event enum for actions to perform while fetching the data from the server

extension HomeViewModel {
    enum Event {
        case loading
        case stopLoading
        case dataLoaded
        case error(Error?)
    }
}
