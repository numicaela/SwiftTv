//
//  MenuBuilder.swift
//  SwiftTv
//
//  Created by Micaela Nuñez on 03/04/2020.
//  Copyright © 2020 Micaela Nuñez. All rights reserved.
//

import UIKit

class MenuBuilder{
    
    static func build() -> UIViewController {
        
        let controller = MenuViewController()
        
        let presenter = MenuPresenter()
        
        let interactor = MenuInteractor()
        
        let router = MenuRouter()
       
        controller.presenter = presenter
        interactor.delegate = presenter
        presenter.interactor = interactor
        presenter.router = router
        presenter.view = controller
        
               
        return controller
    }
    
    
    
}
