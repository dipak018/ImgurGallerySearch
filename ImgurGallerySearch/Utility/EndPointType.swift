//
//  EndPointType.swift
//  ImgurGallerySearch
//
//  Created by Chaudhari, Dipak Bharat (external - Service) on 06/01/24.
//

import Foundation

enum HTTPMethods: String {
    case get = "GET"
    case post = "POST"
}

protocol EndPointType {
    var path: String { get }
    var baseURL: String { get }
    var method: HTTPMethods { get }
    var body: Encodable? { get }
    var headers: [String: String]? { get }
}
