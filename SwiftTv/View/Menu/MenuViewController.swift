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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        fetchShows()
    }
    
    private func setup(){
        title = "Menu"
        setupTable()
    }
    
    
    private func setupTable(){
        
        table?.separatorStyle = .singleLine
        table?.register(UINib(nibName: "MenuCell", bundle: nil), forCellReuseIdentifier: MenuCell.reuseIdentifier)
        table?.delegate = self
        table?.dataSource = self
        table?.rowHeight = 155
        
    }
    
}

extension MenuViewController {
    
    private func fetchShows(){
        
    _ = AF.request("http://api.tvmaze.com/shows")
        .response { (response) in
            guard let data = response.data else {return}
            let decoder = JSONDecoder()
            do {
             let showsData = try decoder.decode(ShowsDTO.self, from: data)
                for show in showsData {
                self.shows.append(ShowDTOMapping.map(show))
                }
                DispatchQueue.main.async {
                    self.table?.reloadData()
                }
            }catch{
                
            }
        }
        
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
        let cell = tableView.dequeueReusableCell(withIdentifier: MenuCell.reuseIdentifier, for: indexPath)
        if let menuCell = cell as? MenuCell {
            let show = shows[indexPath.row]
            menuCell.setup(show: show)
        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath : IndexPath){
        
        let show = shows[indexPath.row]
        let controller = DetailsViewController.init(show: show)
        
        
        navigationController?.pushViewController(controller, animated: true)
        
    }
    
}


