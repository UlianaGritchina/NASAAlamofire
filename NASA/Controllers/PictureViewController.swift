//
//  PictureViewController.swift
//  NASA
//
//  Created by Ульяна Гритчина on 27.01.2022.
//

import UIKit

class PictureViewController: UIViewController {
    
    @IBOutlet var indicator: UIActivityIndicatorView!
    @IBOutlet var pictureImage: UIImageView!
    
    @IBOutlet var infoView: UIView!
    @IBOutlet var titleLable: UILabel!
    @IBOutlet var infoLable: UILabel!
    
    private var astronomyPicture: AstronomyPicture?
    private var shown = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        infoView.layer.opacity = 0

        indicator.startAnimating()
        indicator.hidesWhenStopped = true
        
        fetchData(from:
                    "https://api.nasa.gov/planetary/apod?api_key=j927yMuuumpGvzeDtYe5YUsObO9FzOEnNhp0FnZX")
    }
    
    @IBAction func showInfo(_ sender: UIBarButtonItem) {
        shown.toggle()
        infoView.show(shown: shown)
        infoView.layer.opacity = shown ? 0.8 : 0
    }
    
    private func fetchData(from url: String?) {
        NetworkManager.shared.fetchData(from: url) { result in
            switch result {
                
            case .success(let astronomyPicture):
                self.title = astronomyPicture.date
                self.titleLable.text = astronomyPicture.title
                self.infoLable.text = astronomyPicture.explanation
                
                guard let imageUrl = URL(string: astronomyPicture.url ?? "") else { return }
                guard let imageData = try? Data(contentsOf: imageUrl) else { return }
                self.pictureImage.image = UIImage(data: imageData)
                
                DispatchQueue.main.async {
                    self.indicator.stopAnimating()
                }
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
}

