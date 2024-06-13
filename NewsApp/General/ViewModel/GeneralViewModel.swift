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
    
    private var articles: [ArticleResponseObject] = []
    
    init() {
        loadData()
    }
    
    func getArticle(for row: Int) -> ArticleCellViewModel {
        let article = articles[row]
        return ArticleCellViewModel(article: article)
        
    }
    
    private func loadData() {
        //TODO: Load Data
    }
}
