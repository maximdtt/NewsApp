//
//  TechnologyViewModel.swift
//  NewsApp
//
//  Created by Maksims Šalajevs on 20/06/2024.
//

import Foundation

protocol TechnologyViewModelProtocol {
    var reloadData: (() -> Void)? { get set }
    var showError: ((String) -> Void)? { get set }
    var reloadCell: ((Int) -> Void)? { get set }
    
    var numberOfCells: Int { get }
    
    func getArticle(for row: Int) -> ArticleDTO?
    
    func loadData()
}

final class TechnologyViewModel: TechnologyViewModelProtocol {
    var reloadCell: ((Int) -> Void)?
    var showError: ((String) -> Void)?
    var reloadData: (() -> Void)?
    
    var numberOfCells: Int {
        articles.count
    }
    
    // MARK: - Properties
    
    private var articles: [ArticleDTO] = [] {
        didSet {
            DispatchQueue.main.async {
                self.reloadData?()
            }
        }
    }
    
    func getArticle(for row: Int) -> ArticleDTO? {
        guard row < articles.count else { return nil }
        return articles[row]
    }
    
    func loadData() {
        ApiManager.getTechnologyNews { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let newsDTO):
                self.articles = newsDTO.articles
                self.loadImages()
            case .failure(let error):
                DispatchQueue.main.async {
                    self.showError?(error.localizedDescription)
                }
            }
        }
    }
    
    private func loadImages() {
        for (index, article) in articles.enumerated() {
            guard let urlToImage = article.urlToImage else { continue }
            ApiManager.getImageData(url: urlToImage) { [weak self] result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let data):
                        self?.articles[index].imageData = data
                        self?.reloadCell?(index)
                    case .failure(let error):
                        self?.showError?(error.localizedDescription)
                    }
                }
            }
        }
    }
}
