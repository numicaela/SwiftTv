//
//  MenuVCPresenter.swift
//  SwiftTv
//
//  Created by Micaela Nuñez on 06/03/2020.
//  Copyright © 2020 Micaela Nuñez. All rights reserved.
//

import Foundation

protocol MenuVCPresentable: class {
    
    func launchShows(_ shows:[Show])
    
}

class MenuVCPresenter{
    
    weak var view: MenuVCPresentable?
    
    var shows = [Show]()
    
    func getShows(){
        
        let api = Api()
        api.fetchShows(){(showsData) in
            
            guard let showsDTO = showsData else {return}
    
            for showDTO in showsDTO {
                self.shows.append(ShowDTOMapping.map(showDTO))
            }
            self.view?.launchShows(self.shows)
            
        }

    }
    
    
    
}
