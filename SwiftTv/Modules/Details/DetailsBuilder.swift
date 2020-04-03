//
//  DetailsBuilder.swift
//  SwiftTv
//
//  Created by Micaela Nuñez on 03/04/2020.
//  Copyright © 2020 Micaela Nuñez. All rights reserved.
//

import UIKit

class DetailsBuilder {
    
    static func buildDetails(show: Show) -> UIViewController{
        
        let controller = DetailsViewController()
        let presenter = DetailsPresenter(show: show)
        let interactor = DetailsInteractor()
        let router = DetailsRouter()
        
        controller.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.delegate = presenter
        router.view = controller
        
        presenter.view = controller
        
        return controller
        
    }
    
    
    
}
