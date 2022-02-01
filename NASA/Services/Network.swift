//
//  Network.swift
//  NASA
//
//  Created by Ульяна Гритчина on 30.01.2022.
//

import Foundation

class NetworkManager {
    
    enum NetworkError: Error {
        case badURL
        case noData
    }
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchData(from url: String?, with completion: @escaping(Result <AstronomyPicture, NetworkError>) -> Void) {
        
        guard let url = URL(string: url ?? "" ) else {
            completion(.failure(.badURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                completion(.failure(.noData))
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let astronomyPicture = try JSONDecoder().decode(AstronomyPicture.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(astronomyPicture))
                }
            } catch let error {
                print(error)
            }
            
        }.resume()
    }
}





