//
//  MenuInteractor.swift
//  SwiftTv
//
//  Created by Micaela Nuñez on 25/03/2020.
//  Copyright © 2020 Micaela Nuñez. All rights reserved.
//

import Foundation

protocol MenuInteractorDelegate: class {
    
    func didResponse(shows:[Show])
    
}

class MenuInteractor {
    
    weak var delegate: MenuInteractorDelegate?
    
    func getAllShows(){
        
        var shows = [Show]()
        
        let api = Api()
        api.fetchShows(){ [weak self] (showsData) in
            
            guard let showsDTO = showsData else {return}
            
            for showDTO in showsDTO{
                shows.append(Show(showDTO))
            }
            self?.delegate?.didResponse(shows: shows)
        }
    }
}
