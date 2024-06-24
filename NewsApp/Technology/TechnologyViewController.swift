//
//  TechnologyViewController.swift
//  NewsApp
//
//  Created by Maksims Šalajevs on 07/06/2024.
//

import UIKit
import SnapKit

class TechnologyViewController: UIViewController {
    
    // MARK: - GUI Variables

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        
        
        
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height), collectionViewLayout: layout)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        return collectionView
    }()
    
    //MARK: - Properties
    
    private var viewModel: TechnologyViewModelProtocol
    
    //MARK: - Life Cycle
    
    init(viewModel: TechnologyViewModelProtocol) {
        
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
        
        collectionView.register(GeneralCollectionViewCell.self, forCellWithReuseIdentifier: GeneralCollectionViewCell.reuseID)
        collectionView.register(DetailsCollectionViewCell.self, forCellWithReuseIdentifier: DetailsCollectionViewCell.reuseID)
        
        viewModel.loadData()
        setupUI()
        self.setupViewModel()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//        
//        
//        
//    }
    
    //MARK: - Methods
    
    //MARK: - Private methods
    
    private func setupViewModel() {
        viewModel.reloadData = { [weak self] in
            self?.collectionView.reloadData()
        }
        
        viewModel.reloadCell = { [weak self] row in
            
            row == 0 ?
            self?.collectionView.reloadItems(at: [IndexPath(row: row, section: 0)]) :
            self?.collectionView.reloadItems(at: [IndexPath(row: row-1, section: 1)])
        }
        
        viewModel.showError = { error in
            //TODO: show alert with error
            print(error)
        }
    }
    
    private func setupUI() {
        
        view.backgroundColor = .white
        view.addSubview(collectionView)
        
//        collectionView.register(GeneralCollectionViewCell.self, forCellWithReuseIdentifier: "GeneralCollectionViewCell")
//        collectionView.register(DetailsCollectionViewCell.self, forCellWithReuseIdentifier: "DetailsCollectionViewCell")
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        collectionView.snp.makeConstraints {

            $0.leading.trailing.equalToSuperview().inset(5)
            $0.top.bottom.equalTo(view.safeAreaLayoutGuide) }
        
    }


}
//MARK: - UICollectionViewDataSource

extension TechnologyViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        section == 0 ? 1 : 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let article = viewModel.getArticle(for: indexPath.row) else { return  UICollectionViewCell()}
        
        if indexPath.section == 0 {

            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GeneralCollectionViewCell.reuseID, for: indexPath) as? GeneralCollectionViewCell else {
                return UICollectionViewCell()
            }
            
            //let article = viewModel.getArticle(for: indexPath.row)
            cell.set(article: article)
            
            return cell
            
        } else {
          
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailsCollectionViewCell.reuseID, for: indexPath) as? DetailsCollectionViewCell else {
                return UICollectionViewCell()
            }
            
            //let article = viewModel.getArticle(for: indexPath.row)
            cell.set(article: article)
            
            return cell
            
        }
    }
    
    
}

//MARK: - UICollectionViewDelegate

extension TechnologyViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard let article = viewModel.getArticle(for: indexPath.section == 0 ? 0 : indexPath.row + 1) else { return }
        
        let controller = NewsViewController(viewModel: NewsViewModel(article: article))
        navigationController?.pushViewController(controller, animated: true)

    }
    
}

//MARK: - UICollectionViewDelegateFlowLayout
extension TechnologyViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width
        let firstSectionItemSize = CGSize(width: width, height: width)
        
        let secondSectionItemSize = CGSize(width: width, height: 100)
        
        return indexPath.section == 0 ? firstSectionItemSize : secondSectionItemSize
    }
}
