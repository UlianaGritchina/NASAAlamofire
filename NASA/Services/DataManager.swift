//
//  DataManager.swift
//  NASA
//
//  Created by Ульяна Гритчина on 28.01.2022.
//

import UIKit

extension PictureViewController {
    
    func fetchDate() {
        guard let url = URL(string: "https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            do {
                self.astronomyPicture = try JSONDecoder().decode(AstronomyPicture.self, from: data)
                
                DispatchQueue.main.async {
                    
                    self.indivator.startAnimating()
                    self.indivator.hidesWhenStopped = true
                    
                    self.navigationItem.title = self.astronomyPicture.date
                    self.titleLable.text = self.astronomyPicture.title
                    self.infoLable.text = self.astronomyPicture.explanation
                    
                    guard let url = URL(string: self.astronomyPicture.url ?? "") else {return}
                    guard let imageData = try? Data(contentsOf: url) else {return}
                    
                    self.pictureImage.image = UIImage(data: imageData)
                    
                    self.indivator.stopAnimating()
                }
                
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
