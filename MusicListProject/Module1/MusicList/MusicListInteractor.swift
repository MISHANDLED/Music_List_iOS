//
//  MusicListInteractor.swift
//  MusicListProject
//
//  Created by Devansh Mohata on 05/07/23.
//

import Foundation

protocol MusicListInteractorProtocol: AnyObject {
    func getMusicFromAPI()
}

final class MusicListInteractor: MusicListInteractorProtocol {
    private var next: Int = 0
    weak var presenter: MusicListPresenterProtocol?
    
    func getMusicFromAPI() {
        guard let url = URL(string: "https://itunes.apple.com/search?term=adele") else { return }
        
        var urlRequest: URLRequest = .init(url: url)
        urlRequest.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: urlRequest) { [weak self] data, response, error in
            if error != nil {
                print("Error in API")
                return
            }
            self?.parseResponse(data: data)
        }.resume()
    }
    
    
    private func parseResponse(data: Data?) {
        if let data {
            do {
                let jsonResponse = try JSONDecoder().decode(MusicListWrapperModel.self, from: data)
                DispatchQueue.main.async { [weak self] in
                    self?.sendDataToPresenter(data: jsonResponse)
                }
            } catch let error {
                print("Error in Parsing Endpoint \n\(error)")
            }
        }
    }
    
    private func sendDataToPresenter(data: MusicListWrapperModel) {
        let data: [MusicListModels.PresenterModel] = data.results.compactMap {
            if let name = $0.artistName,
               let track = $0.trackName,
               let price = $0.price,
               let desc = $0.description,
               let imgURL = $0.trackImgUrl {
                return .init(artistName: name, trackName: track, trackImg: imgURL, description: desc, price: price)
            }
            return nil
        }
        
        presenter?.showMusicList(data: data)
    }
}
