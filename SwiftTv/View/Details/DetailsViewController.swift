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
        summary?.text = show.summary?.htmlAtributtedString
        
        let url = URL(string: (show.image!))
        imageShow?.downloadImage(from: url!)
        summary?.lineBreakMode = .byWordWrapping
        summary?.numberOfLines = 0
        
    }
    
    private func setup(){
        title = "Details"
    }
}

extension UIImageView {
    
    func getData(from url: URL, completion: @escaping (Data?,URLResponse?,Error?)->()){
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    func downloadImage(from url: URL){
        getData(from: url){ data, response, error in
            guard let data = data, error == nil else {return}
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
            }
        }
    }
}

extension String {
    var htmlAtributtedString: String? {
        guard let data = data(using: .utf8) else {return nil}
        
        do {
            return try NSAttributedString(data: data,
                                          options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue] , documentAttributes: nil).string
        }catch let error as NSError {
            print(error.localizedDescription)
            return  nil
        }
    }
    
}
