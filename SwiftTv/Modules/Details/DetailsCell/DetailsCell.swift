//
//  DetailsCell.swift
//  SwiftTv
//
//  Created by Micaela Nuñez on 07/04/2020.
//  Copyright © 2020 Micaela Nuñez. All rights reserved.
//

import UIKit

class DetailsCell: UITableViewCell {
    
    @IBOutlet var card: UIView?
    @IBOutlet var episodeLabel: UILabel?
   
    static let reuseIdentifier = "DetailsCell"

    override func awakeFromNib() {
        super.awakeFromNib()
    }


    func setup(_ episode: Episode){
        selectionStyle = .none
        episodeLabel?.text = episode.name
    }
    
}
