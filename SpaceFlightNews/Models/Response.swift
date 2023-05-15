//
//  Response.swift
//  SpaceFlightNews
//
//  Created by Anggi Fergian on 16/05/23.
//

import Foundation

struct Response: Decodable {
    let id: Int
    let title: String
    let url: String
    let imageUrl: String
    let newsSite: String
    let summary: String
    let publishedAt: String
    let updatedAt: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case url
        case imageUrl
        case newsSite
        case summary
        case publishedAt
        case updatedAt
    }
    
    init(from decoder: Decoder) throws {
        let container   = try decoder.container(keyedBy: CodingKeys.self)
        self.id         = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
        self.title      = try container.decodeIfPresent(String.self, forKey: .title) ?? ""
        self.url        = try container.decodeIfPresent(String.self, forKey: .url) ?? ""
        self.imageUrl   = try container.decodeIfPresent(String.self, forKey: .imageUrl) ?? ""
        self.newsSite   = try container.decodeIfPresent(String.self, forKey: .newsSite) ?? ""
        self.summary    = try container.decodeIfPresent(String.self, forKey: .summary) ?? ""
        self.publishedAt = try container.decodeIfPresent(String.self, forKey: .publishedAt) ?? ""
        self.updatedAt  = try container.decodeIfPresent(String.self, forKey: .updatedAt) ?? ""
    }
}
