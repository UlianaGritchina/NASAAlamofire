//
//  Extension.swift
//  NASA
//
//  Created by Ульяна Гритчина on 31.01.2022.
//

import UIKit

extension UIView {
    func show(shown: Bool) {
        let animation = CABasicAnimation(keyPath: "opacity")
        if shown {
            animation.fromValue = 0
            animation.toValue = 0.8
            animation.duration = 0.3
        } else {
            animation.fromValue = 0.8
            animation.toValue = 0
            animation.duration = 0.3
        }
        layer.add(animation, forKey: nil)
    }
}
