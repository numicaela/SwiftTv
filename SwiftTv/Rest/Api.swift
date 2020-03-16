//
//  Api.swift
//  SwiftTv
//
//  Created by Micaela Nuñez on 03/03/2020.
//  Copyright © 2020 Micaela Nuñez. All rights reserved.
//

import Foundation
import Alamofire

class  Api {
    
    
    func fetchShows(completion: @escaping ([ShowDTO]?)-> Void){
        
        let url = "http://api.tvmaze.com/shows"
        
        AF.request(url)
            .response { (response) in
                guard let data = response.data else {return}
                let decoder = JSONDecoder()
                do {
                    let showsData = try decoder.decode(showsDTO.self, from: data)
                    completion(showsData)
                }catch{
                    completion(nil)
                }
        }
        
    }
    
    func fetchEpisodes(id: Int?, completion: @escaping ([EpisodeDTO]?)-> Void){
        
        if let idEpisode = id {
            let url = "http://api.tvmaze.com/shows/\(idEpisode)/episodes"
            
            AF.request(url)
                .response { (response) in
                    guard let data = response.data else {return}
                    let decoder = JSONDecoder()
                    do {
                        let episodesData = try decoder.decode(episodesDTO.self, from: data)
                        completion(episodesData)
                    }catch{
                        completion(nil)
                    }
            }
        }
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
