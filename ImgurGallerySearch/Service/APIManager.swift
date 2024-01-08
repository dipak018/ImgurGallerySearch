//
//  APIManager.swift
//  ImgurGallerySearch
//
//  Created by Chaudhari, Dipak Bharat (external - Service) on 06/01/24.
//

import Foundation
import Alamofire

enum DataError: Error {
    case invalidResponse
    case invalidURL
    case invalidData
    case network(Error?)
    case decoding(Error?)
}

typealias ResultHandler<T> = (Result<T, DataError>) -> Void

typealias ResultHandlerO = (Result<GalleryDataEntity, DataError>) -> Void

class APIManager {
    
    // MARK: - Props
    static let shared = APIManager()
    private let networkHandler: NetworkHandler
    private let responseHandler: ResponseHandler
    static var commonHeaders: [String: String] {
        return [
            "Authorization": "Client-ID \(Constant.API.clientId)"
        ]
    }
    // MARK: - Init
    init(networkHandler: NetworkHandler = NetworkHandler(),
         responseHandler: ResponseHandler = ResponseHandler()) {
        self.networkHandler = networkHandler
        self.responseHandler = responseHandler
    }
    
}

// MARK: - Public

extension APIManager {
    
    // Generic service request
    func request<T: Codable>(
        inputString: String = "",
        modelType: T.Type,
        type: ImgurGalleryEndpoint,
        completion: @escaping ResultHandler<T>
    ) {
        guard let url = type.getURL(inputString: inputString) else {
            completion(.failure(.invalidURL))
            return
        }        
        var request = URLRequest(url: url)
        request.httpMethod = type.method.rawValue
        
        if let parameters = type.body {
            request.httpBody = try? JSONEncoder().encode(parameters)
        }
        
        request.allHTTPHeaderFields = type.headers
        
        // Network Request - URL TO DATA
        networkHandler.requestDataAPI(url: request) { result in
            switch result {
            case .success(let data):
                // Json parsing - Decoder - DATA TO MODEL
                self.responseHandler.parseResonseDecode(
                    data: data,
                    modelType: modelType) { response in
                        switch response {
                        case .success(let mainResponse):
                            completion(.success(mainResponse))
                        case .failure(let error):
                            completion(.failure(error))
                        }
                    }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}


// MARK: - Generic newtork handler for getting the data for API request
class NetworkHandler {
    func requestDataAPI(
        url: URLRequest,
        completionHandler: @escaping (Result<Data, DataError>) -> Void
    ) {
        let session = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let response = response as? HTTPURLResponse,
                  200 ... 299 ~= response.statusCode else {
                completionHandler(.failure(.invalidResponse))
                return
            }
            guard let data, error == nil else {
                completionHandler(.failure(.invalidData))
                return
            }
            completionHandler(.success(data))
        }
        session.resume()
    }
}

// MARK: - Generic response handler for parsing resonse of API request
class ResponseHandler {
    func parseResonseDecode<T: Decodable>(
        data: Data,
        modelType: T.Type,
        completionHandler: ResultHandler<T>
    ) {
        do {
            let userResponse = try JSONDecoder().decode(modelType, from: data)
            completionHandler(.success(userResponse))
        }catch {
            completionHandler(.failure(.decoding(error)))
        }
    }
    
}
