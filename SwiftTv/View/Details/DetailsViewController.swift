//
//  DeatailsViewController.swift
//  SwiftTv
//
//  Created by Micaela Nuñez on 05/02/2020.
//  Copyright © 2020 Micaela Nuñez. All rights reserved.
//

import UIKit
import Alamofire

class DetailsViewController: UIViewController {
    
    @IBOutlet var name: UILabel?
    @IBOutlet var imageShow: UIImageView?
    @IBOutlet var summary: UILabel?
    @IBOutlet var language: UILabel?
    @IBOutlet var rating: UILabel?
    @IBOutlet var episodes: UILabel?
    
    @IBOutlet var containerData: UIStackView?
    
    private let show: Show
    
    
    
    
    init(show: Show) {
        self.show = show
        super.init(nibName: "DetailsViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup(show: self.show)
       
    }
    
    
    func setup(show: Show){
        name?.text = show.name
        language?.text = show.language
        rating?.text = show.rating
        summary?.attributedText = StringManager.htmlAtributtedString(show.summary)
        summary?.textColor = UIColor.systemYellow
        summary?.font = UIFont.systemFont(ofSize: 18.0)
        guard let url = URL(string: show.image ?? "") else {return}
        imageShow?.downloadImage(from: url)
     
    }
    
   
    
    private func setup(){
        title = "Details"
    }
}




