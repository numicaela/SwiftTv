//
//  DetailsInteractor.swift
//  SwiftTv
//
//  Created by Micaela Nuñez on 26/03/2020.
//  Copyright © 2020 Micaela Nuñez. All rights reserved.
//

import Foundation

protocol DetailsInteractorDelegate: class {
    
    func didResponse(episodes: [Episode])
}

class DetailsInteractor {
    
    weak var delegate: DetailsInteractorDelegate?
    private var episodes = [Episode]()
    
    func fetchEpisodes(show: Show){
        let api = Api()
        api.fetchEpisodes(id: show.id){(episodeData) in
            guard let episodesDTO = episodeData else {return}
            for episodeDTO in episodesDTO {
                self.episodes.append(Episode(episodeDTO))
            }
            self.delegate?.didResponse(episodes: self.episodes)
        }
    }
    
    
}
