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
    @IBOutlet var table: UITableView?
    
    
    var presenter: DetailsPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        
    }
    
    
    func setupShow(show: Show){
        name?.text = show.name
        language?.text = show.language
        rating?.text = "Rating: \(show.rating ?? 0.0)"
        setupSummary(show: show)
        setupImage(show: show)
        setupTable()
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
    
    func setupTable(){
        setupDelegate()
        table?.separatorStyle = .singleLine
        table?.register(UINib(nibName: "DetailsCell", bundle: nil), forCellReuseIdentifier: DetailsCell.reuseIdentifier)
    }
    
    
    func setupDelegate(){
        table?.delegate = self
        table?.dataSource = self
    }
    
}


extension DetailsViewController : UITableViewDataSource, UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.setEpisodes().count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: DetailsCell.reuseIdentifier, for: indexPath) as! DetailsCell
        
        guard let episode = presenter?.getEpisodeIndex(indexPath) else {return cell}
        cell.setup(episode)
        
        return cell
        
    }  
    
}

extension DetailsViewController: DetailsVCPresentable {
   
    func launchShow(_ show: Show) {
        setupShow(show: show)
        
        DispatchQueue.main.async {
            self.table?.reloadData()
        }
    }
}






