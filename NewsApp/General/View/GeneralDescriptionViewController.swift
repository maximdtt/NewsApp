//
//  GeneralDescriptionViewController.swift
//  NewsApp
//
//  Created by Maksims Šalajevs on 10/06/2024.
//

import UIKit
import SnapKit

final class GeneralDescriptionViewController: UIViewController {
   
    //MARK: - GUI Variables
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
            
        label.text = "2025.05.25"
            
        return label
        }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Title"
        label.font = .systemFont(ofSize: 45)
        
        return label
    }()
    
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        
        view.image = UIImage(named: "Image") ?? UIImage.add
        
        return view
    }()
    
    private lazy var desriptionLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Here will be some description about the news.....Here will be some description about the news.....Here will be some description about the news.....Here will be some description about the news.....Here will be some description about the news.....Here will be some description about the news.....Here will be some description about the news.....Here will be some description about th"
        
        return label
    }()
    
   //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupUI()
    }
    
    //MARK: - Methods
    
    
    
    //MARK: - Private methods
    
    private func setupUI() {
        view.addSubview(dateLabel)
        view.addSubview(titleLabel)
        view.addSubview(imageView)
        view.addSubview(desriptionLabel)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        dateLabel.snp.makeConstraints { 
            $0.top.trailing.equalTo(view.safeAreaLayoutGuide) }
        
        titleLabel.snp.makeConstraints { 
            $0.top.equalTo(dateLabel.snp.bottom).offset(30)
            $0.centerX.equalToSuperview()
        }
        
        imageView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom)
            $0.leading.trailing.equalToSuperview().inset(7)
        }
        
        desriptionLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).inset(-25)
            $0.leading.trailing.equalToSuperview().inset(7)
        }
        
    }
}
