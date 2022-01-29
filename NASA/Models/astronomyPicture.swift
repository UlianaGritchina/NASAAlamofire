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
}
