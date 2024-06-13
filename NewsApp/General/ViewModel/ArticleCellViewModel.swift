//
//  ArticleCellViewModel.swift
//  NewsApp
//
//  Created by Maksims Šalajevs on 13/06/2024.
//

import Foundation

struct ArticleCellViewModel {
    let title: String
    let description: String
    let date: String
    
    init(article: ArticleResponseObject) {
        title = article.title
        description = article.description
        date = article.publishedAt
    }
}
