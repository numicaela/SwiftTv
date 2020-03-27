//
//  MenuVCPresenter.swift
//  SwiftTv
//
//  Created by Micaela Nuñez on 06/03/2020.
//  Copyright © 2020 Micaela Nuñez. All rights reserved.
//

import Foundation
import UIKit

protocol MenuPresentable: class {
    func launchShows()
}

class MenuPresenter {
    
    private let interactor = MenuInteractor()
    weak var view: MenuPresentable?
    private var shows = [Show]()
    
    init() {
        
    }
    
    func viewDidLoad(){
        interactor.delegate = self
        
    }
    
    func viewDidAppear(){
        interactor.getAllShows()
    }
    
    func getShows() -> [Show]{
        return self.shows
    }
    
    func getShowIndex(_ indexPath: IndexPath) -> Show{        
        return shows[indexPath.row]
    }
    
    func didSelectRowAt(_ indexPath: IndexPath, from viewController: UIViewController){
        let show = shows[indexPath.row]
        let presenter = DetailsPresenter.init(show)
        let destinationViewController = DetailsViewController(presenter: presenter)
        viewController.navigationController?.pushViewController(destinationViewController, animated: true)
    }
    
}

extension MenuPresenter: MenuInteractorDelegate {
   
    func didResponse(shows: [Show]) {
        self.shows = shows
        self.view?.launchShows()
    }
    
}
