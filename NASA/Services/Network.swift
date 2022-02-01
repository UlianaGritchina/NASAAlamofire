//
//  Network.swift
//  NASA
//
//  Created by Ульяна Гритчина on 30.01.2022.
//

import Foundation
import Alamofire

enum NetworkError: Error {
    case badURL
    case noData
    case decodingError
}

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchData(from url: String, with completion: @escaping(Result <AstronomyPicture, NetworkError>) -> Void) {
        AF.request(url)
        
            .responseJSON{ dataResponse in
                guard let statusCode = dataResponse.response?.statusCode else { return }
                if (200...299).contains(statusCode) {
                    guard let value = dataResponse.value else { return }
                    guard let astronomyPictureData = value as? [String : Any] else { return }
                    
                    let astronomyPicture = AstronomyPicture(
                        astronomyPictureData: astronomyPictureData
                    )
                    completion(.success(astronomyPicture))
                    
                } else {
                    completion(.failure(.decodingError))
                    guard let error = dataResponse.error else { return }
                    print(error)
                }
                
            }
    }
}








