//
//  DetailsCollectionViewCell.swift
//  NewsApp
//
//  Created by Maksims Šalajevs on 12/06/2024.
//

import UIKit
import SnapKit

final class DetailsCollectionViewCell: UICollectionViewCell {
    //MARK: - GUI Variables
    
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        
        view.image = UIImage(named: "image")
        view.contentMode = .scaleAspectFill
        view.layer.masksToBounds = true
        
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .black
        label.text = "News Title"
        label.numberOfLines = 2
        
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 14)
        label.textColor = .gray
        label.text = "some news text will be here. please. remove this mock text"
        label.numberOfLines = 2
        
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
    
    private func setupUI() {
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        
        
         setupConstraints()
    }
    private func setupConstraints() {
        imageView.snp.makeConstraints { 
            $0.top.leading.bottom.equalToSuperview()
            $0.width.height.equalTo(self.frame.height)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.trailing.equalToSuperview()
            $0.leading.equalTo(imageView.snp.trailing).offset(5)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(5)
            $0.leading.equalTo(imageView.snp.trailing).offset(5)
            $0.trailing.bottom.equalToSuperview()
        }
    }
}
