//
//  GeneralViewModel.swift
//  NewsApp
//
//  Created by Maksims Šalajevs on 13/06/2024.
//

import Foundation

protocol GeneralViewModelProtocol {
    var reloadData: (()  -> Void)? { get set }
    
    var numberOfCells: Int { get }
    
    func getArticle(for row: Int) -> ArticleCellViewModel
    
}

final class GeneralViewModel: GeneralViewModelProtocol {
    
    var numberOfCells: Int {
        articles.count
    }
    
    var reloadData: (() -> Void)?
    
    
    //MARK: - Properties
    
    private var articles: [ArticleResponseObject] = [] {
        didSet {
            reloadData?()  
        }
    }
    
    init() {
        loadData()
    }
    
    func getArticle(for row: Int) -> ArticleCellViewModel {
        let article = articles[row]
        return ArticleCellViewModel(article: article)
        
    }
    
    private func loadData() {
        //TODO: Load Data
        setupMockObject()
    }
    
    private func setupMockObject() {
        articles = [
            ArticleResponseObject(title: "First mock title", description: "First mock text hello", urlToImage: "....", publishedAt: "12.12.1212"),
            ArticleResponseObject(title: "second mock title", description: "First mock text hello", urlToImage: "....", publishedAt: "12.12.1212"),
            ArticleResponseObject(title: "third mock title", description: "First mock text hello", urlToImage: "....", publishedAt: "12.12.1212"),
            ArticleResponseObject(title: "4.    mock title", description: "First mock text hello", urlToImage: "....", publishedAt: "12.12.1212"),
            ArticleResponseObject(title: "fifth mock title", description: "First mock text hello", urlToImage: "....", publishedAt: "12.12.1212"),
            
        ]
    }
}
