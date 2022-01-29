//
//  ViewController.swift
//  NASA
//
//  Created by Ульяна Гритчина on 27.01.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBAction func unwind(segue: UIStoryboardSegue) {}
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let navugationVC = segue.destination as? UINavigationController else {return}
        let pictureVC = navugationVC.topViewController as? PictureViewController
        pictureVC?.fetchDate()
    }
    
}
