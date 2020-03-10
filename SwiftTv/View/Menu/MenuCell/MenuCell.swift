//
//  MenuCell.swift
//  SwiftTv
//
//  Created by Micaela Nuñez on 04/02/2020.
//  Copyright © 2020 Micaela Nuñez. All rights reserved.
//

import UIKit
import Alamofire


class MenuCell: UITableViewCell {
    
    @IBOutlet var card: UIView?
    @IBOutlet var name: UILabel?
    @IBOutlet var genre: UILabel?
    @IBOutlet var backgroundImage: UIImage?
    static let reuseIdentifier = "MenuCell"
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        clear()
    }
    
    func setup(show: Show){
        name?.text = show.name
        genre?.text = "default"
    }
    
    private func setup(){
        prepareForReuse()
        
        selectionStyle = .none
        card?.layer.borderWidth = 1
        card?.layer.borderColor = UIColor.lightGray.cgColor
        card?.layer.backgroundColor = UIColor.black.cgColor
    }
    
    private  func clear(){
        name?.text = ""
        genre?.text = "" 
    }
    
}


    
    


