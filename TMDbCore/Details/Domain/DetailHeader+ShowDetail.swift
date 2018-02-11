//
//  DetailHeader+ShowDetail.swift
//  TMDbCore
//
//  Created by Tomas Moyano on 11.02.18.
//  Copyright © 2018 Guille Gonzalez. All rights reserved.
//

import Foundation

extension DetailHeader {
    init(show: ShowDetail, dateFormatter: DateFormatter) {
        title = show.name
        posterPath = show.posterPath
        backdropPath = show.backdropPath
        
        let releaseDate = dateFormatter.date(from: show.releaseDate)
        let year = (releaseDate?.year).map { String($0) }
        
        let episodesAmt = "\(show.episodes) episodes."
        
        metadata = [year, episodesAmt].flatMap { $0 }.joined(separator: " - ")
    }
}
