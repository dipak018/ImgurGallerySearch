//
//  HomeViewModelTests.swift
//  ImgurGallerySearchTests
//
//  Created by Chaudhari, Dipak Bharat (external - Service) on 08/01/24.
//

import XCTest
@testable import ImgurGallerySearch

final class HomeViewModelTests: XCTestCase {
    
    var viewModel: HomeViewModel!

    override func setUp() {
        super.setUp()
        viewModel = HomeViewModel()
    }

    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }

    func testFetchTopImagesSuccess() {
        // Arrange
        let searchTopic = "nature"
        let galleryDataEntity = GalleryDataEntity(success: true, data: [], status: 200)
        let mockAPIManager = MockAPIManager(response: .success(galleryDataEntity))

        viewModel.eventHandler = { event in
            switch event {
            case .loading:
                // Assert loading event
                XCTAssertTrue(true)
            case .stopLoading:
                // Assert stopLoading event
                XCTAssertTrue(true)
            case .dataLoaded:
                // Assert dataLoaded event
                XCTAssertNotNil(self.viewModel.galleryData)
            case .error:
                XCTFail("Unexpected error event")
            }
        }

        // Act
        viewModel.fetchTopImagesFromImgurGallery(searchTopic: searchTopic)
        
    }

    func testFetchTopImagesFailure() {
        // Arrange
        let searchTopic = "asdasdas"
        let mockError = NSError(domain: "error", code: 123, userInfo: nil)
        let mockAPIManager = MockAPIManager(response: .failure(mockError))

        viewModel.eventHandler = { event in
            switch event {
            case .loading:
                // Assert loading event
                XCTAssertTrue(true)
            case .stopLoading:
                // Assert stopLoading event
                XCTAssertTrue(true)
            case .dataLoaded:
                XCTFail("Unexpected dataLoaded event")
            case .error(let error):
                // Assert error event
                XCTAssertNotNil(error)
                XCTAssertEqual(error as? NSError, mockError)
            }
        }
        // Act
        viewModel.fetchTopImagesFromImgurGallery(searchTopic: searchTopic)
    }
}

// Mock APIManager for testing
class MockAPIManager: APIManager {
    var response: Result<GalleryDataEntity, Error>
    
    init(response: Result<GalleryDataEntity, Error>) {
        self.response = response
        super.init()
    }
}
