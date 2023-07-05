//
//  MusicListAPIModel.swift
//  MusicListProject
//
//  Created by Devansh Mohata on 05/07/23.
//

import Foundation

struct MusicListWrapperModel: Decodable {
    let results: [MusicListModel]
    
    struct MusicListModel: Decodable {
        let artistName: String?
        let trackImgUrl: String?
        let trackName: String?
        let price: Double?
        let description: String?
        
        enum CodingKeys: String, CodingKey {
            case artistName, description
            case trackImgUrl = "artworkUrl100"
            case trackName = "collectionName"
            case price = "collectionPrice"
        }
    }
}
