//
//  Episode.swift
//  SwiftTv
//
//  Created by Micaela Nuñez on 06/03/2020.
//  Copyright © 2020 Micaela Nuñez. All rights reserved.
//

import Foundation

struct Episode{
    
    let id: Int?
    let name: String?
    let season: Int?
    let number: Int?
    let airdate: String?
    let airtime: String?
    let runtime: Int?
    let summary: String?
    
    init(_ episode: EpisodeDTO) {
        id = episode.id
        name = episode.name
        season = episode.season
        number = episode.number
        airdate = episode.airdate
        airtime = episode.airtime
        runtime = episode.runtime
        summary = episode.summary
        
    }
    
    
    
    
}
