//
//  astronomyPicture.swift
//  NASA
//
//  Created by Ульяна Гритчина on 27.01.2022.
//

import Foundation

struct AstronomyPicture: Decodable {
    let title: String?
    let date: String?
    let explanation: String?
    let url: String?
    
    init(astronomyPictureData: [String: Any]) {
        self.title = astronomyPictureData["title"] as? String
        self.date = astronomyPictureData["date"] as? String
        self.explanation = astronomyPictureData["explanation"]as? String
        self.url = astronomyPictureData["url"] as? String
    }
}
