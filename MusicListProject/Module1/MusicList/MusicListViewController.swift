//
//  MusicListViewController.swift
//  MusicListProject
//
//  Created by Devansh Mohata on 05/07/23.
//

import UIKit

protocol MusicListViewControllerProtocol: AnyObject {
    func showMusicList(data: [MLTableViewCell.ViewModel])
}

class MusicListViewController: UIViewController {
    @IBOutlet private weak var mlTblView: UITableView! {
        didSet {
            mlTblView.register(UINib(nibName: MLTableViewCell.nibName, bundle: nil), forCellReuseIdentifier: MLTableViewCell.nibName)
            mlTblView.dataSource = self
        }
    }
    
    var presenter: MusicListPresenterProtocol?
    
    private var musicList: [MLTableViewCell.ViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.fetchMusicList()
    }
}

extension MusicListViewController: MusicListViewControllerProtocol {
    func showMusicList(data: [MLTableViewCell.ViewModel]) {
        musicList = data
        mlTblView.reloadData()
    }
}

extension MusicListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        musicList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: MLTableViewCell.nibName) as? MLTableViewCell {
            cell.configure(musicList[indexPath.row])
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        if indexPath.row
    }
}
