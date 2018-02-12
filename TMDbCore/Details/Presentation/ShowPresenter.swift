//
//  ShowPresenter.swift
//  TMDbCore
//
//  Created by Tomas Moyano on 11.02.18.
//  Copyright © 2018 Guille Gonzalez. All rights reserved.
//

import RxSwift

final class ShowPresenter: DetailPresenter {
    private let repository: ShowRepositoryProtocol
    private let dateFormatter: DateFormatter
    private let detailNavigator: DetailNavigator
    
    private let identifier: Int64
    private let disposeBag = DisposeBag()
    
    weak var view: DetailView?
    
    init(repository: ShowRepositoryProtocol,
         dateFormatter: DateFormatter,
         identifier: Int64,
         detailNavigator: DetailNavigator) {
        self.repository = repository
        self.dateFormatter = dateFormatter
        self.identifier = identifier
        self.detailNavigator = detailNavigator
    }
    
    func didLoad() {
        view?.setLoading(true)
        
        repository.show(withIdentifier: identifier)
            .map { [weak self] movie in
                self?.detailSections(for: movie) ?? []
            }
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] sections in
                self?.view?.update(with: sections)
                }, onDisposed: { [weak self] in
                    self?.view?.setLoading(false)
            })
            .disposed(by: disposeBag)
    }
    
    func didSelect(item: PosterStripItem) {
        detailNavigator.showDetail(withIdentifier: item.identifier, mediaType: .person)
    }
    
    private func detailSections(for show: ShowDetail) -> [DetailSection] {
        var detailSections: [DetailSection] = [
            .header(DetailHeader(show: show, dateFormatter: dateFormatter))
        ]
        
        if let overview = show.overview {
            detailSections.append(.about(title: "Overview", detail: overview))
        }
        
        let items = show.credits?.cast.map { PosterStripItem(castMember: $0) }
        
        if let items = items {
            detailSections.append(.posterStrip(title: "Cast", items: items))
        }
        
        return detailSections
    }
}
