//
//  GeneralCollectionViewCell.swift
//  NewsApp
//
//  Created by Maksims Šalajevs on 09/06/2024.
//
import UIKit
import SnapKit


final class GeneralCollectionViewCell: UICollectionViewCell {
    
    //MARK: - GUI Variables
    
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        
        view.image = UIImage(named: "Image") ?? UIImage.add
        
        return view
    }()
    
    private lazy var blackView: UIView = {
        let view = UIView()
        
        view.backgroundColor = .black
        view.alpha = 0.5
        
         return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Title"
        label.textColor = .white
        
        return label
    }()
    
    
    //MARK: - Initializations
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - Methods
    
    func set(article: ArticleCellViewModel) {
        titleLabel.text = article.title
    }
    
    //MARK: - Private methods
    
    private func setupUI() {
        addSubview(imageView)
        addSubview(blackView)
        addSubview(titleLabel)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        imageView.snp.makeConstraints { $0.size.edges.equalToSuperview() }
        
        blackView.snp.makeConstraints { 
            $0.height.equalTo(50)
            $0.leading.trailing.bottom.equalToSuperview()
            
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.bottom.equalTo(blackView)
            $0.leading.trailing.equalTo(blackView).offset(5)
        }
    }
}
