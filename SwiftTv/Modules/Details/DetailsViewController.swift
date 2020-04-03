//
//  DeatailsViewController.swift
//  SwiftTv
//
//  Created by Micaela Nuñez on 05/02/2020.
//  Copyright © 2020 Micaela Nuñez. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet var name: UILabel?
    @IBOutlet var imageShow: UIImageView?
    @IBOutlet var summary: UILabel?
    @IBOutlet var language: UILabel?
    @IBOutlet var rating: UILabel?
    @IBOutlet var episodesCount: UILabel?
    
    
    var presenter: DetailsPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        
    }
    
    
    func setupShow(show: Show){
        name?.text = show.name
        language?.text = show.language
        rating?.text = "\(show.rating ?? 0.0)"
        setupSummary(show: show)
        setupImage(show: show)
    }
    
    func setupSummary(show: Show){
        summary?.attributedText = StringManager.htmlAtributtedString(show.summary)
        summary?.textColor = UIColor.systemYellow
        summary?.font = UIFont.systemFont(ofSize: 18.0)
    }
    
    func setupImage(show: Show){
        guard let url = URL(string: show.image ?? "") else {return}
        imageShow?.downloadImage(from: url)
    }
    
    func setupEpisodes(episodes: [Episode]){
        episodesCount?.text = "\(episodes.count)"
    }
    
}

extension DetailsViewController: DetailsVCPresentable {
   
    func launchShow(_ show: Show) {
        setupShow(show: show)
    }
    
    
    func launchEpisodes(_ episodes: [Episode]) {
        setupEpisodes(episodes: episodes)
    }
}






