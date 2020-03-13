//
//  MenuViewController.swift
//  SwiftTv
//
//  Created by Micaela Nuñez on 04/02/2020.
//  Copyright © 2020 Micaela Nuñez. All rights reserved.
//

import UIKit
import Alamofire


class MenuViewController: UIViewController {
    
    @IBOutlet var table: UITableView?
    
    var shows = [Show]()
    
    private let presenter: MenuVCPresenter
    
    
    init(presenter: MenuVCPresenter) {
        self.presenter = presenter
        super.init(nibName: "MenuViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        presenter.view = self
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter.getShows()
    }
    
    private func setup(){
        title = "Menu"
        setupTable()
    }
    
    
     func setupTable(){
        setupDelegate()
        table?.separatorStyle = .singleLine
        table?.register(UINib(nibName: "MenuCell", bundle: nil), forCellReuseIdentifier: MenuCell.reuseIdentifier)
    }
    
    func setupDelegate(){
        table?.delegate = self
        table?.dataSource = self
    }
    
}

extension MenuViewController : UITableViewDataSource, UITableViewDelegate{
    

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MenuCell.reuseIdentifier, for: indexPath) as! MenuCell
        let show = shows[indexPath.row]
        cell.setup(show: show)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath : IndexPath){
        
        let show = shows[indexPath.row]
        presenter.pushToDetailVC(show: show, from: self)
//        let controller = DetailsViewController.init(show: show)
//        navigationController?.pushViewController(controller, animated: true)
    }
    
}

extension MenuViewController: MenuVCPresentable {
    
    func launchShows(_ shows: [Show]) {
        self.shows = shows
        DispatchQueue.main.async {
            self.table?.reloadData()
        }
    }

}


