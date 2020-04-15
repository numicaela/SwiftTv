//
//  DeatailsViewController.swift
//  SwiftTv
//
//  Created by Micaela Nuñez on 05/02/2020.
//  Copyright © 2020 Micaela Nuñez. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var imageShow: UIImageView!
    @IBOutlet weak var summary: UILabel!
    @IBOutlet weak var language: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIStackView!
    @IBOutlet weak var tableHeight: NSLayoutConstraint!
    
    
    var presenter: DetailsPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        presenter?.view = self
        
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
    
    func setupConstraint(){
        
        tableHeight?.constant = table.contentSize.height
        view.layoutSubviews()
        scrollView?.contentSize = CGSize.init(width: view.frame.width, height: contentView.frame.height + table.contentSize.height)
        scrollView.layoutIfNeeded()
        
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
            self.setupConstraint()
        }
        
    }
}






