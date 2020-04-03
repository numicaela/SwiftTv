//
//  DetailsVCPresenter.swift
//  SwiftTv
//
//  Created by Micaela Nuñez on 06/03/2020.
//  Copyright © 2020 Micaela Nuñez. All rights reserved.
//

import Foundation

protocol DetailsVCPresentable: class {
    func launchEpisodes(_ episodes: [Episode])
    func launchShow(_ show: Show)
}

class DetailsPresenter {
    
    var interactor = DetailsInteractor()
    var router = DetailsRouter()
    weak var view: DetailsVCPresentable?
    private var show: Show
    private var episodes = [Episode]()
    
    init(show: Show) {
        self.show = show
    }
    
    func viewDidLoad(){
        getEpisodes(show)
    }
    
    
   private func getEpisodes(_ show: Show){
        interactor.fetchEpisodes(show: show)
    }
    
    
}

extension DetailsPresenter: DetailsInteractorDelegate{
    
    func didResponse(episodes: [Episode]) {
        self.episodes = episodes
        view?.launchShow(show)
        view?.launchEpisodes(episodes)
    }
    
    
}
