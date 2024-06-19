//
//  NewsViewController.swift
//  NewsApp
//
//  Created by Maksims Šalajevs on 10/06/2024.
//

import UIKit
import SnapKit

final class NewsViewController: UIViewController {
   
    //MARK: - GUI Variables
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
            
        return label
        }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 35)
        label.numberOfLines = .max
        
        return label
    }()
    
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        
        return view
    }()
    
    private lazy var desriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = .max
        
        return label
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        
                
        return scrollView
    }()
    //MARK: - Properties
    
    private let viewModel: NewsViewModelProtocol
    
   //MARK: - Life Cycle
    
    init(viewModel: NewsViewModelProtocol) {
        
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupUI()
    }
    
    //MARK: - Methods
    
    
    
    //MARK: - Private methods
    
    private func setupUI() {
        
        [dateLabel, titleLabel, imageView, scrollView].forEach { view.addSubview($0) }
        
        scrollView.addSubview(desriptionLabel)
        
        titleLabel.text = viewModel.title
        desriptionLabel.text = viewModel.description
        dateLabel.text = viewModel.date
        
        if let data = viewModel.imageData,
           let image = UIImage(data: data) {
            
            imageView.image = image
        } else {
            imageView.image = UIImage(named: "Image")
            
            setupConstraints()
        }
    }
    
    private func setupConstraints() {
        
        dateLabel.snp.makeConstraints {
            $0.top.trailing.equalTo(view.safeAreaLayoutGuide)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(dateLabel.snp.bottom).offset(30)
            $0.leading.trailing.equalToSuperview()
        }
        
        imageView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom)
            $0.leading.trailing.equalToSuperview().inset(7)
        }
        
        scrollView.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(25)
            $0.leading.trailing.bottom.equalToSuperview().inset(10)
        }
        
        desriptionLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
			$0.leading.trailing.bottom.equalToSuperview().inset(10)
        }
        
        desriptionLabel.snp.makeConstraints {
			$0.top.bottom.equalToSuperview()
			$0.width.equalTo(scrollView.snp.width).inset(10)
        }
    }
}
