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
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = .max
        return label
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    /// Что бы потом его встроить в скролл с содержимым
    private lazy var contentView: UIView = {
        let view = UIView()
        return view
    }()

    // MARK: - Properties
    
    private let viewModel: NewsViewModelProtocol
    
    // MARK: - Life Cycle
    
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
    
    // MARK: - Methods
    
    // MARK: - Private methods
    
    private func setupUI() {
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        [dateLabel, titleLabel, imageView, descriptionLabel].forEach { contentView.addSubview($0) }
        
        titleLabel.text = viewModel.title
        descriptionLabel.text = viewModel.description
        dateLabel.text = viewModel.date
        
        if let data = viewModel.imageData, let image = UIImage(data: data) {
            imageView.image = image
        } else {
            imageView.image = UIImage(named: "Image")
        }
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        scrollView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        contentView.snp.makeConstraints {
            $0.edges.width.equalToSuperview()
        }
        
        dateLabel.snp.makeConstraints {
            $0.top.trailing.equalTo(contentView).inset(10)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(dateLabel.snp.bottom).offset(30)
            $0.leading.trailing.equalTo(contentView).inset(10)
        }
        
        imageView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalTo(contentView).inset(10)
            $0.height.equalTo(200) // или другой подходящий размер
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(25)
            $0.leading.trailing.bottom.equalTo(contentView).inset(10)
        }
    }
}

