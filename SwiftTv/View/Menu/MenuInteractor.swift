//
//  MenuInteractor.swift
//  SwiftTv
//
//  Created by Micaela Nuñez on 25/03/2020.
//  Copyright © 2020 Micaela Nuñez. All rights reserved.
//

import Foundation

protocol MenuInteractorDelegate: class {
    
    func didResponse(shows: [Show])
    
}

class MenuInteractor {
    
    weak var delegate: MenuInteractorDelegate?
    
    private var shows = [Show]()
    
    func getAllShows(){
        
        let api = Api()
        api.fetchShows(){(showsData) in
            
            guard let showsDTO = showsData else {return}
            
            for showDTO in showsDTO{
                self.shows.append(Show(showDTO))
            }
            self.delegate?.didResponse(shows: self.shows)
        }
        
    }
}
