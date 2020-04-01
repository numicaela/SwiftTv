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
    private var router = MenuRouter()
    weak var view: MenuPresentable?
    private var shows = [Show]()
    
    init(router: MenuRouter) {
        self.router = router
         interactor.delegate = self
    }
    
    func viewDidLoad(){
        interactor.getAllShows()
    }
    
    func getShows() -> [Show]{
        return self.shows
    }
    
    func getShowIndex(_ indexPath: IndexPath) -> Show{        
        return shows[indexPath.row]
    }
    
    func didSelectRowAt(show: Show, from view: UIViewController){
        router.pushShowDetail(show: show, from: view)
    }
}

extension MenuPresenter: MenuInteractorDelegate {
   
    func didResponse(shows: [Show]) {
        self.shows = shows
        self.view?.launchShows()
    }
    
}
