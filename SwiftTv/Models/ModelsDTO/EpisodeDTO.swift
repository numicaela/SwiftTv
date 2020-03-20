//
//  Episodes.swift
//  SwiftTv
//
//  Created by Micaela Nuñez on 11/02/2020.
//  Copyright © 2020 Micaela Nuñez. All rights reserved.
//

import Foundation

struct EpisodeDTO: Codable {
    let id: Int?
    let url: String?
    let name: String?
    let season, number: Int?
    let airdate: String?
    let airtime: String?
    let runtime: Int?
    let image: Image?
    let summary: String?
    let links: Links?

    enum CodingKeys: String, CodingKey {
        case id, url, name, season, number, airdate, airtime, runtime, image, summary
        case links = "_links"
    }
}

// MARK: - Image
struct Image: Codable {
    let medium, original: String?
}

// MARK: - Links
struct Links: Codable {
    let linksSelf: SelfClass?

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
    }
}

// MARK: - SelfClass
struct SelfClass: Codable {
    let href: String?
}



typealias EpisodesDTO = [EpisodeDTO]?
