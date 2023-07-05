//
//  MLTableViewCell.swift
//  MusicListProject
//
//  Created by Devansh Mohata on 05/07/23.
//

import Kingfisher
import UIKit

class MLTableViewCell: UITableViewCell {
    struct ViewModel {
        let imgURL: URL?
        let artistName: String
        let trackName: String
        let price: String
        let description: String
    }
    
    static let nibName = "MLTableViewCell"
    
    @IBOutlet private weak var imgView: UIImageView!
    @IBOutlet private weak var artistLbl: UILabel!
    @IBOutlet private weak var trackLbl: UILabel!
    @IBOutlet private weak var priceLbl: UILabel!
    @IBOutlet private weak var descLbl: UILabel!
    
    override func prepareForReuse() {
        imgView.image = nil
        artistLbl.text = nil
        trackLbl.text = nil
        priceLbl.text = nil
        descLbl.text = nil
    }
    
    func configure(_ data: ViewModel) {
        imgView.kf.setImage(with: data.imgURL)
        artistLbl.text = data.artistName
        trackLbl.text = data.trackName
        priceLbl.text = data.price
        descLbl.text = data.description
    }
}
