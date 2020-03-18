//
//  ShowDTOMapping.swift
//  SwiftTv
//
//  Created by Micaela Nuñez on 10/03/2020.
//  Copyright © 2020 Micaela Nuñez. All rights reserved.
//

import Foundation

class ShowDTOMapping{
    
    static func map (_ dto: ShowDTO) -> Show {
        
        return Show(id: dto.id,
                    name: dto.name,
                    type: dto.type,
                    language: dto.language,
                    genres: dto.genres,
                    image: dto.image?.original ,
                    rating: parseDblToStr(dto.rating),
                    summary: dto.summary
        )
    }
    
    static func parseDblToStr(_ rtngDTO: RatingDTO?) -> String?{
        
        if let rtng = rtngDTO?.average{
            
            let rtngStr = String(rtng)
            return rtngStr
        }
        
        return nil
        
    }
    
  
    
}
