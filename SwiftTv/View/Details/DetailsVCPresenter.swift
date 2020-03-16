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
}

class DetailsVCPresenter {
    
    weak var view: DetailsVCPresentable?
    
    private var show: Show
    
    var episodes = [Episode]()
    
    init(_ show: Show) {
        
        self.show = show
    }
    
   
    func getEpisode(){
        
        let api = Api()
        api.fetchEpisodes(id: show.id){(episodeData) in
            
            guard let episodesDTO = episodeData else {return}
            
            for episodeDTO in episodesDTO {
                self.episodes.append(Episode(episodeDTO))
            }
            
            self.view?.launchEpisodes(self.episodes)
        }
    }
    
  
    
    
    
    
    
}
