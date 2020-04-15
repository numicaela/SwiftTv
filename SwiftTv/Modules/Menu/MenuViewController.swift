//
//  MenuViewController.swift
//  SwiftTv
//
//  Created by Micaela Nuñez on 04/02/2020.
//  Copyright © 2020 Micaela Nuñez. All rights reserved.
//

import UIKit


class MenuViewController: UIViewController {
    
    @IBOutlet weak var table: UITableView!
    
    var presenter: MenuPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        presenter?.viewDidLoad()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
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
        return presenter?.getShows().count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MenuCell.reuseIdentifier, for: indexPath) as! MenuCell
        guard let show = presenter?.getShowIndex(indexPath) else { return cell }
        cell.setup(show)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath : IndexPath){
        guard let show = presenter?.getShowIndex(indexPath) else { return }
        presenter?.didSelectRowAt(show: show, from: self)
    }
    
}

extension MenuViewController: MenuPresentable {
    
    func launchShows() {
        DispatchQueue.main.async {
            self.table?.reloadData()
        }
    }
}


