//
//  TechnologyViewModel.swift
//  NewsApp
//
//  Created by Maksims Šalajevs on 20/06/2024.
//

import Foundation

protocol TechnologyViewModelProtocol {
    var reloadData: (()  -> Void)? { get set }
    var showError: ((String) -> Void)? { get set }
    var reloadCell: ((Int) -> Void)? { get set  }
    
    var numberOfCells: Int { get }
    
    func getArticle(for row: Int) -> ArticleCellViewModel
    
    func loadData()
}

final class TechnologyViewModel: TechnologyViewModelProtocol {
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
     
    func getArticle(for row: Int) -> ArticleCellViewModel {
        let article = articles[row]
        loadImage(for: row)
        return article
        
    }
    
    func loadData() {
        ApiManager.getTechnologyNews { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let articles):
                self.articles = self.convertToCellViewModel(articles)
                //self.loadImage(for: 0)
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
        
//        for (index, article) in articles.enumerated() {
//            ApiManager.getImageData(url: article.imageUrl) { [weak self] result in
//                    
//                    DispatchQueue.main.async {
//                        switch result {
//                        case .success(let data):
//                            self?.articles[index].imageData = data
//                            self?.reloadCell?(index)
//                        case .failure(let error):
//                            self?.showError?(error.localizedDescription)
//                        }
//                    }
//                }
//            }
        }
    
    
    private func convertToCellViewModel(_ articles: [ArticleResponseObject]) -> [ArticleCellViewModel] {
        
        articles.map { ArticleCellViewModel(article: $0) }
    }
    
    private func setupMockObject() {
        articles = [
            ArticleCellViewModel(article: ArticleResponseObject(title: "First mock title", description: "First mock text hello", urlToImage: "....", date: "12.12.1212"))
            
        ]
    }
}
