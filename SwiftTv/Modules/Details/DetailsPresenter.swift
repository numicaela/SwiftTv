//
//  DetailsVCPresenter.swift
//  SwiftTv
//
//  Created by Micaela Nuñez on 06/03/2020.
//  Copyright © 2020 Micaela Nuñez. All rights reserved.
//

import Foundation

protocol DetailsVCPresentable: class {
    func launchShow(_ show: Show)
}

class DetailsPresenter {
    
    var interactor: DetailsInteractor?
    var router: DetailsRouter?
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
        interactor?.fetchEpisodes(show: show)
    }
    
    func setEpisodes() ->[Episode]{
        return self.episodes
    }
    
    func getEpisodeIndex(_ indexPath: IndexPath) -> Episode{
        return episodes[indexPath.row]
    }
    
    func launchEpisodesBySeason(_episodes: [Episode]) {
        let arrayOfEpisodes = groupEpisodesBySeason(episodes)
        show.episodes = EpisodesBySeason.init(arrayEp: arrayOfEpisodes)
    }
    
    func tittleBySection(section: Int) -> String {
        return "Season \(section + 1)"
    }
    
    func numberOfSection() -> Int {
        let arrayOfEpisodes = groupEpisodesBySeason(episodes)
        return arrayOfEpisodes.count
    }
    
    
    func groupEpisodesBySeason(_ episodes: [Episode]) -> [[Episode]]{
        
        var episodesBySeason = [[Episode]]()
        var season = [Episode]()
        var episodeReturnable = episodes
        
        season.append(episodeReturnable[0])
        episodeReturnable.removeFirst()
        
        for episode in episodeReturnable {
            if episode.season == season.last?.season{
                season.append(episode)
            }else{
                episodesBySeason.append(season)
                season = []
                season.append(episode)
            }
        }
        episodesBySeason.append(season)
        return episodesBySeason
    }
    
    
}

extension DetailsPresenter: DetailsInteractorDelegate{
    
    func didResponse(episodes: [Episode]) {
        self.episodes = episodes
        launchEpisodesBySeason(_episodes: episodes)
        view?.launchShow(show)
        
    }
    
    
}
