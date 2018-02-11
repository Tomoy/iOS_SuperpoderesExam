//
//  CreditsMovie.swift
//  TMDbCore
//
//  Created by Tomas Moyano on 11.02.18.
//  Copyright © 2018 Guille Gonzalez. All rights reserved.
//

import Foundation

struct CreditsMovie: Decodable {
    struct WorksIn: Decodable {
        let identifier: Int64
        let posterPath: String?
        let title: String
        let character: String
        
        private enum CodingKeys: String, CodingKey {
            case identifier = "id"
            case title
            case character
            case posterPath = "poster_path"
        }
    }
    
    let cast: [WorksIn]
}
