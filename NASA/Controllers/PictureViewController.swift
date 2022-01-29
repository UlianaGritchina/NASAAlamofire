//
//  PictureViewController.swift
//  NASA
//
//  Created by Ульяна Гритчина on 27.01.2022.
//

import UIKit

class PictureViewController:
    UIViewController {
    
    @IBOutlet var indivator: UIActivityIndicatorView!
    @IBOutlet var pictureImage: UIImageView!
    
    @IBOutlet var infoView: UIView!
    @IBOutlet var titleLable: UILabel!
    @IBOutlet var infoLable: UILabel!
    
    var astronomyPicture: AstronomyPicture!
    var imageTitle: String!
    var imageInfo: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        infoView.isHidden = true
    }
    
    @IBAction func showInfo(_ sender: UIBarButtonItem) {
        infoView.isHidden.toggle()
    }
}


