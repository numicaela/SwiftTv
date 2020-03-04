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
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
 
        card?.backgroundColor = selected ? UIColor.systemIndigo.withAlphaComponent(0.1) : .black
    }
    
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
        genre?.text = genreType(show: show)
    }
    
    
    private func genreType(show: Show) -> String {
        var gnr = ""
        guard let genres = show.genres  else {return gnr}
        var genresBis =  genres
        gnr += genresBis[0]
        genresBis.removeFirst()
        genresBis.forEach(){
            gnr += ", \($0)"
        }
        return gnr
    }
    
    
    private func setup(){
        prepareForReuse()
        
        selectionStyle = .none
        card?.layer.borderWidth = 1
        card?.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    private  func clear(){
        name?.text = ""
        genre?.text = "" 
    }
    
}


    
    


