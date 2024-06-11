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
        
        label.text = "Here will be some description about the news.....Here will be some description about the news.....Here will be some description about the news.....Here will be some description about the news.....Here will be some description about the news.....Here will be some description about the news.....Here will be some description about the news.....Here will be some description about the news.....Here will be some description about the news.....Here will be some description about the news.....Here will be some description about the news.....Here will be some description about the news.....Here will be some description about the news.....Here will be some description about the news.....Here will be some description about the news.....Here will be some description about the news.....Here will be some description about the news.....Here will be some description about the news.....Here will be some description about the news.....Here will be some description about the news.....Here will be some "
        label.numberOfLines = .max
        
        return label
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        
                
        return scrollView
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
<<<<<<< HEAD
        
        [dateLabel, titleLabel, imageView, scrollView].forEach { view.addSubview($0) }
        
=======
		[dateLabel, titleLabel, imageView, scrollView].forEach { view.addSubview($0) }
>>>>>>> 1fe4f546f81ef0389a64daba77c3aca72ab30403
        scrollView.addSubview(desriptionLabel)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        
<<<<<<< HEAD
        dateLabel.snp.makeConstraints {
            $0.top.trailing.equalTo(view.safeAreaLayoutGuide)
        }
=======
		dateLabel.snp.makeConstraints {
			$0.top.trailing.equalTo(view.safeAreaLayoutGuide)
		}
>>>>>>> 1fe4f546f81ef0389a64daba77c3aca72ab30403
        
        titleLabel.snp.makeConstraints { 
            $0.top.equalTo(dateLabel.snp.bottom).offset(30)
            $0.centerX.equalToSuperview()
        }
        
        imageView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom)
            $0.leading.trailing.equalToSuperview().inset(7)
        }
        
        scrollView.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(25)
<<<<<<< HEAD
            $0.leading.trailing.bottom.equalToSuperview().inset(10)
        }
        
        desriptionLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(scrollView.snp.width).inset(10)
=======
			$0.leading.trailing.bottom.equalToSuperview().inset(10) // зададим отступы для скролл-вью
        }
        
        desriptionLabel.snp.makeConstraints {
			$0.top.bottom.equalToSuperview()
			$0.width.equalTo(scrollView.snp.width).inset(10) // ширину контента установим по ширине скролл-вью с отступом
>>>>>>> 1fe4f546f81ef0389a64daba77c3aca72ab30403
        }
    }
}
