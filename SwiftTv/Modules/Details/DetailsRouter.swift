//
//  DetailsRouter.swift
//  SwiftTv
//
//  Created by Micaela Nuñez on 01/04/2020.
//  Copyright © 2020 Micaela Nuñez. All rights reserved.
//

import UIKit

class DetailsRouter{
    
    static func start(show: Show) -> UIViewController {
         
        let presenter = DetailsPresenter(show: show, router: DetailsRouter())
        
        let controller = DetailsViewController(presenter: presenter)
        
        return controller
        
    }
    
    
}
