//
//  PosterStripItem+Film.swift
//  TMDbCore
//
//  Created by Tomas Moyano on 11.02.18.
//  Copyright © 2018 Guille Gonzalez. All rights reserved.
//

import Foundation
extension PosterStripItem {
    init(film: CreditsMovie.WorksIn) {
        identifier = film.identifier
        mediaType = .movie
        title = film.title
        posterPath = film.posterPath
        metadata = film.character
    }
}

