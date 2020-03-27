//
//  MenuViewController.swift
//  SwiftTv
//
//  Created by Micaela Nuñez on 04/02/2020.
//  Copyright © 2020 Micaela Nuñez. All rights reserved.
//

import UIKit


class MenuViewController: UIViewController {
    
    @IBOutlet var table: UITableView?
    
    private let presenter: MenuPresenter
    
    
    init(presenter: MenuPresenter) {
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
        presenter.viewDidLoad()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter.viewDidAppear()
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
        return presenter.getShows().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MenuCell.reuseIdentifier, for: indexPath) as! MenuCell
        let show = presenter.getShowIndex(indexPath)
        cell.setup(show)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath : IndexPath){
        presenter.didSelectRowAt(indexPath, from: self)
    }
    
}

extension MenuViewController: MenuPresentable {
    
    func launchShows() {
        DispatchQueue.main.async {
            self.table?.reloadData()
        }
    }
}


