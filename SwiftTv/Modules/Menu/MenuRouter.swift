//
//  MenuRouter.swift
//  SwiftTv
//
//  Created by Micaela Nuñez on 01/04/2020.
//  Copyright © 2020 Micaela Nuñez. All rights reserved.
//

import UIKit

class MenuRouter {

    func pushShowDetail(show: Show, from view: UIViewController){
        
        guard let nav = view.navigationController else { return }
        
        let showDetail = DetailsBuilder.buildDetails(show: show)
        
        nav.pushViewController(showDetail, animated: true)
        
    }
    
}
