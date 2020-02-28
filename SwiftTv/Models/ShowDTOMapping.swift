//
//  ShowDTOMapping.swift
//  SwiftTv
//
//  Created by Micaela Nuñez on 20/02/2020.
//  Copyright © 2020 Micaela Nuñez. All rights reserved.
//

import Foundation

struct ShowDTOMapping {
    
    static func map (_ dto: ShowDTO) -> Show {
        
        return Show(id: dto.id,
                    name: dto.name,
                    type: dto.type,
                    languaje: dto.language,
                    genres: dto.genres,
                    image: dto.image?.original ,
                    rating: dto.rating?.average,
                    summary: dto.summary
        )
    }
    
}
