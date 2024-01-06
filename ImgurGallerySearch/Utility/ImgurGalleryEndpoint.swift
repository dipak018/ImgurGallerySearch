//
//  ImgurGalleryEndpoint.swift
//  ImgurGallerySearch
//
//  Created by Chaudhari, Dipak Bharat (external - Service) on 06/01/24.
//

import Foundation


enum ImgurGalleryEndpoint {
    case imgurGallery // Module - GET
}

extension ImgurGalleryEndpoint: EndPointType {
    

    var path: String {
        switch self {
        case .imgurGallery:
            return "products"
        }
    }

    var baseURL: String {
        switch self {
        case .imgurGallery:
            return Constant.API.gallerySearchURL
        }
    }

    var method: HTTPMethods {
        switch self {
        case .imgurGallery:
            return .get
        }
    }

    var body: Encodable? {
        switch self {
        case .imgurGallery:
            return nil
        }
    }

    var headers: [String : String]? {
        APIManager.commonHeaders
    }
    
    func getURL(inputString:String) -> URL? {
        switch self {
        case .imgurGallery:
            let urlString = "\(Constant.API.gallerySearchURL)?q=\(inputString)&q_type=\(Constant.API.supportedImageTypes)"
            return URL(string: urlString)
        }
    }
}
