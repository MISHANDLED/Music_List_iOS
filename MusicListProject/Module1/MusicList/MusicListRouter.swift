//
//  MusicListRouter.swift
//  MusicListProject
//
//  Created by Devansh Mohata on 05/07/23.
//

import Foundation
import UIKit

protocol MusicListRouterProtocol: AnyObject { }

final class MusicListRouter: MusicListRouterProtocol {
    static func createModule() -> MusicListViewController? {
        let storyboard = UIStoryboard(name: "MusicListStoryboard", bundle: nil)
        if let vc = storyboard.instantiateInitialViewController() as? MusicListViewController {
            let router = MusicListRouter()
            let interactor = MusicListInteractor()
            let presenter = MusicListPresenter(view: vc, interactor: interactor, router: router)
            
            interactor.presenter = presenter
            vc.presenter = presenter
            return vc
        }
        
        return nil
    }
}
