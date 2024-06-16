//
//  NewsResponseObject.swift
//  NewsApp
//
//  Created by Maksims Šalajevs on 13/06/2024.
//

import Foundation

struct NewsResponseObject: Codable {
    let totalResults: Int
    let articles: [String]
    
    enum CodingKeys: CodingKey {
        case totalResults
        case articles
    }
}
