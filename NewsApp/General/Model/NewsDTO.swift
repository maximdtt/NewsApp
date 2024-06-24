//
//  NewsDTO.swift
//  NewsApp
//
//  Created by Maksims Šalajevs on 13/06/2024.
//

import Foundation

/// Исправим модель для респонса, не будем выносить отдельно для ячейки. Тк вся модель возвращается в одном ответе
/// DTO - объект ответа от сервера

// MARK: - NewsDTO
struct NewsDTO: Codable {
    let status: String
    let totalResults: Int
    let articles: [ArticleDTO]
}

// MARK: - Article
struct ArticleDTO: Codable {
//    let source: Source
    let author: String?
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
    var imageData: Data?
}

// MARK: - Source
struct Source: Codable {
    let id: String?
    let name: String
}
