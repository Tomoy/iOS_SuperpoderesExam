//
//  PersonDetail.swift
//  TMDbCore
//
//  Created by Tomas Moyano on 11.02.18.
//  Copyright © 2018 Guille Gonzalez. All rights reserved.
//

import Foundation

struct PersonDetail: Decodable {
    let identifier: Int64
    let name: String
    let profilePicPath: String?
    let birthday : String?
    let biography : String?
    let credits: CreditsMovie?
    
    private enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case name
        case profilePicPath = "profile_path"
        case birthday = "birthday"
        case biography
        case credits = "movie_credits"
    }
}
