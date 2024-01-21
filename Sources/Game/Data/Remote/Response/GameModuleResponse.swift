//
//  File.swift
//  
//
//  Created by Magistra Apta on 19/01/24.
//

import Foundation

public struct GameModuleResponse: Codable {
    let count: Int
    let next: String
    let results: [GameModuleEntryResponse]
    let seoTitle, seoDescription, seoKeywords, seoH1: String
    let noindex, nofollow: Bool
    let description: String
    let nofollowCollections: [String]

    enum CodingKeys: String, CodingKey {
        case count, next, results
        case seoTitle = "seo_title"
        case seoDescription = "seo_description"
        case seoKeywords = "seo_keywords"
        case seoH1 = "seo_h1"
        case noindex, nofollow, description
        case nofollowCollections = "nofollow_collections"
    }
}



// MARK: - Result
public struct GameModuleEntryResponse: Identifiable ,Codable {
    public let id: Int
    let slug, name, released: String
    let backgroundImage: String
    let rating: Double
    


    enum CodingKeys: String, CodingKey {
        case id, slug, name, released
        case backgroundImage = "background_image"
        case rating
    }
}
