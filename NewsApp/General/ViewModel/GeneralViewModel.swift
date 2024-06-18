//
//  GeneralViewModel.swift
//  NewsApp
//
//  Created by Maksims Šalajevs on 13/06/2024.
//

import Foundation

protocol GeneralViewModelProtocol {
    var reloadData: (()  -> Void)? { get set }
    var showError: ((String) -> Void)? { get set }
    var reloadCell: ((Int) -> Void)? { get set  }
    
    var numberOfCells: Int { get }
    
    func getArticle(for row: Int) -> ArticleCellViewModel
    
}

final class GeneralViewModel: GeneralViewModelProtocol {
    var reloadCell: ((Int) -> Void)?
    
    var showError: ((String) -> Void)?
    
    
    var numberOfCells: Int {
        articles.count
    }
    
    var reloadData: (() -> Void)?
    
    
    //MARK: - Properties
    
    private var articles: [ArticleCellViewModel] = [] {
        didSet {
            DispatchQueue.main.async {
                self.reloadData?()
            }
        }
    }
    
    init() {
        loadData()
    }
    
    func getArticle(for row: Int) -> ArticleCellViewModel {
        let article = articles[row]
        loadImage(for: row )
        return article
        
    }
    
    private func loadData() {
        ApiManager.getNews { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let articles):
                self.articles = self.convertToCellViewModel(articles)
            case .failure(let error):
                DispatchQueue.main.async {
                    self.showError?(error.localizedDescription)
                }
            }
        }
        
    }
     
    private func loadImage(for row: Int) {
        //TODO: get imageData
        guard let url = URL(string: articles[row].imageUrl),
              let data = try? Data(contentsOf: url) else { return }
        
        articles[row].imageData = data
        reloadCell?(row)
        
    }
    
    private func convertToCellViewModel(_ articles: [ArticleResponseObject]) -> [ArticleCellViewModel] {
        
        return articles.map { ArticleCellViewModel(article: $0) }
    }
    
    private func setupMockObject() {
        articles = [
            ArticleCellViewModel(article: ArticleResponseObject(title: "First mock title", description: "First mock text hello", urlToImage: "....", date: "12.12.1212"))
            
        ]
    }
}
