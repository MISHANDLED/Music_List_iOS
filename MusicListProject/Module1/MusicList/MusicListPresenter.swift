//
//  MusicListPresenter.swift
//  MusicListProject
//
//  Created by Devansh Mohata on 05/07/23.
//

import Foundation

protocol MusicListPresenterProtocol: AnyObject {
    func fetchMusicList()
    func showMusicList(data: [MusicListModels.PresenterModel])
}

final class MusicListPresenter: MusicListPresenterProtocol {
    weak var view: MusicListViewControllerProtocol?
    var interactor: MusicListInteractorProtocol?
    var router: MusicListRouterProtocol?
    
    init(
        view: MusicListViewControllerProtocol,
        interactor: MusicListInteractorProtocol,
        router: MusicListRouterProtocol
    ) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func fetchMusicList() {
        interactor?.getMusicFromAPI()
    }
    
    func showMusicList(data: [MusicListModels.PresenterModel]) {
        let transformedData: [MLTableViewCell.ViewModel] = data.map {
            .init(imgURL: URL(string: $0.trackImg),
                  artistName: $0.artistName,
                  trackName: $0.trackName,
                  price: "$ \($0.price)",
                  description: $0.description
            )
        }
        
        view?.showMusicList(data: transformedData)
    }
}

