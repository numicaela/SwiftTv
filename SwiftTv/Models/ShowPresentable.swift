//
//  ShowPresentable.swift
//  SwiftTv
//
//  Created by Micaela Nuñez on 09/03/2020.
//  Copyright © 2020 Micaela Nuñez. All rights reserved.
//

import Foundation

struct ShowPresentable {
    
    let id: Int?
     let name: String?
     let type: String?
     let language: String?
     let genres: String?
     let image: URL?
     let rating: String?
     let summary: String?
    
    init(_ show: Show) {
        
        id = show.id
        name = show.name ?? "no data"
        type = show.type ?? "no data"
        language = show.language ?? "no data"
        genres = StringManager.getStringFromArray(show.genres) ?? "no data"
        rating = show.rating ?? "no data"
        summary = show.summary
        guard let url = show.image else {self.image = nil; return}
        image = URL(string: url)
        
    }
        
    
}
