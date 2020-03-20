//
//  Show.swift
//  SwiftTv
//
//  Created by Micaela Nuñez on 20/02/2020.
//  Copyright © 2020 Micaela Nuñez. All rights reserved.
//

import Foundation

struct Show {
    
    let id: Int?
    let name: String?
    let type: String?
    let language: String?
    let genres: [String]?
    let image: String?
    let rating: Double?
    let summary: String?
    
    init(_ show: ShowDTO) {
        id = show.id
        name = show.name
        type = show.language
        language = show.language
        genres = show.genres
        image = show.image?.original
        rating = show.rating?.average
        summary = show.summary
    }
    
  
    
}
