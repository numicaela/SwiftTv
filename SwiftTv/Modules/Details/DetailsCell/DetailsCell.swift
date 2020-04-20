//
//  DetailsCell.swift
//  SwiftTv
//
//  Created by Micaela Nuñez on 07/04/2020.
//  Copyright © 2020 Micaela Nuñez. All rights reserved.
//

import UIKit

class DetailsCell: UITableViewCell {
    
    @IBOutlet weak var card: UIView!
    @IBOutlet weak var episodeLabel: UILabel!
   
    static let reuseIdentifier = "DetailsCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }


    func setup(_ episode: Episode){
        selectionStyle = .none
        episodeLabel?.text = episode.name
    }
    
    private func setup(){
        
        selectionStyle = .none
        card.layer.borderWidth = 1
        card.layer.borderColor = UIColor.lightGray.cgColor
        card.layer.backgroundColor = UIColor.black.cgColor
    }
    
}
