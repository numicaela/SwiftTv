//
//  Shows.swift
//  SwiftTv
//
//  Created by Micaela Nuñez on 04/02/2020.
//  Copyright © 2020 Micaela Nuñez. All rights reserved.
//

import Foundation

// MARK: - Show
struct ShowDTO: Codable {
    let id: Int?
    let url: String?
    let name: String?
    let type: String?
    let language: String?
    let genres: [String]?
    let status: String?
    let runtime: Int?
    let premiered: String?
    let officialSite: String?
    let schedule: ScheduleDTO?
    let rating: RatingDTO?
    let weight: Int?
    let network, webChannel: NetworkDTO?
    let externals: ExternalsDTO?
    let image: ImageShowDTO?
    let summary: String?
    let updated: Int?

    enum CodingKeys: String, CodingKey {
        case id, url, name, type, language, genres, status, runtime, premiered, officialSite, schedule, rating, weight, network, webChannel, externals, image, summary, updated
    }


    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = (try? container.decode(Int.self, forKey: .id))
        self.url = (try? container.decode(String.self, forKey: .url))
        self.name = (try? container.decode(String.self, forKey: .name))
        self.type = try? container.decode(String.self, forKey: .type)
        self.language = try? container.decode(String.self, forKey: .language)
        self.genres = try? container.decode([String].self, forKey: .genres)
        self.status = try? container.decode(String.self, forKey: .status)
        self.runtime = try? container.decode(Int.self, forKey: .runtime)
        self.premiered = try? container.decode(String.self, forKey: .premiered)
        self.officialSite = try? container.decode(String.self, forKey: .officialSite)
        self.schedule = try? container.decode(ScheduleDTO.self, forKey: .schedule)
        self.rating = try? container.decode(RatingDTO.self, forKey: .rating)
        self.weight = try? container.decode(Int.self, forKey: .weight)
        self.network = try? container.decode(NetworkDTO.self, forKey: .network)
        self.webChannel = try? container.decode(NetworkDTO.self, forKey: .webChannel)
        self.externals = try? container.decode(ExternalsDTO.self, forKey: .externals)
        self.image = try? container.decode(ImageShowDTO.self, forKey: .image)
        self.summary = try? container.decode(String.self, forKey: .summary)
        self.updated = try? container.decode(Int.self, forKey: .updated)
    }


}



// MARK: - Externals
struct ExternalsDTO: Codable {
    let tvrage: Int?
    let thetvdb: Int?
    let imdb: String?
}


// MARK: - Image
struct ImageShowDTO: Codable {
    let medium, original: String?
}

// MARK: - Nextepisode
struct NextepisodeDTO: Codable {
    let href: String?
}

// MARK: - Network
struct NetworkDTO: Codable {
    let id: Int?
    let name: String?
    let country: CountryDTO?
}

// MARK: - Country
struct CountryDTO: Codable {
    let name: String?
    let code: String?
    let timezone: String?
}

// MARK: - Rating
struct RatingDTO: Codable {
    let average: Double?
}

// MARK: - Schedule
struct ScheduleDTO: Codable {
    let time: String?
    let days: String?
}

typealias showsDTO = [ShowDTO]


