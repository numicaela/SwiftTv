//
//  MenuRouter.swift
//  SwiftTv
//
//  Created by Micaela Nuñez on 01/04/2020.
//  Copyright © 2020 Micaela Nuñez. All rights reserved.
//

import UIKit

class MenuRouter {
    
    static func start() -> UIViewController {
        
        let presenter = MenuPresenter(router: MenuRouter())
        
        let controller = MenuViewController(presenter: presenter)
        
        return controller
        
    }
    
    func pushShowDetail(show: Show, from view: UIViewController){
        
        guard let nav = view.navigationController else { return }
        
        let showDetail = DetailsRouter.start(show: show)
        
        nav.pushViewController(showDetail, animated: true)
        
    }
    
    
    
    
    
    
    
    
}
