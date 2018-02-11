//
//  FeaturedRepositoryMock.swift
//  TMDbCoreTests
//
//  Created by Tomas Moyano on 08.10.17.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import Foundation
import RxSwift

@testable import TMDbCore

final class FeaturedRepositoryMock: FeaturedRepositoryProtocol {
    
    private(set) var moviesNowPlayingCalled = false
    private(set) var moviesNowPlayingParameters: String?
    var moviesNowPlayingResult = Observable<[Movie]>.just([])
    
    private(set) var showsOnTheAirCalled = false
    var showsOnTheAirResult = Observable<[Show]>.just([])
    
    func moviesNowPlaying(region: String) -> Observable<[Movie]> {
        moviesNowPlayingCalled = true
        moviesNowPlayingParameters = region
        
        return moviesNowPlayingResult
    }
    
    func showsOnTheAir() -> Observable<[Show]> {
        showsOnTheAirCalled = true
        return showsOnTheAirResult
    }
}
