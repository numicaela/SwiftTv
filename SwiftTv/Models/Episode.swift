//
//  Episodes.swift
//  SwiftTv
//
//  Created by Micaela Nuñez on 11/02/2020.
//  Copyright © 2020 Micaela Nuñez. All rights reserved.
//

import Foundation

struct Episode: Codable {
    let id: Int?
    let url: String?
    let name: String?
    let season, number: Int?
    let airdate: String?
    let airtime: Airtime?
    let airstamp: Date?
    let runtime: Int?
    let image: Image?
    let summary: String?
    let links: Links?

    enum CodingKeys: String, CodingKey {
        case id, url, name, season, number, airdate, airtime, airstamp, runtime, image, summary
        case links = "_links"
    }
}

enum Airtime: String, Codable {
    case the2100 = "21:00"
    case the2200 = "22:00"
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

typealias Episodes = [Episode]
