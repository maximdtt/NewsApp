//
//  NewsViewModel.swift
//  NewsApp
//
//  Created by Maksims Šalajevs on 19/06/2024.
//

import Foundation

protocol NewsViewModelProtocol {
    var title: String { get }
    var description: String { get }
    var date: String { get }
    var imageData: Data? { get }
}


final class NewsViewModel: NewsViewModelProtocol {
    let title: String
    
    let description: String
    
    let date: String
    
    let imageData: Data?
    
    
    init(article: ArticleCellViewModel) {
        title = article.title
        description = article.description ?? ""
        date = article.date
        imageData = article.imageData
    }
}
