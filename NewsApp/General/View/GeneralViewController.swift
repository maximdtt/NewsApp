//
//  GeneralViewController.swift
//  NewsApp
//
//  Created by Maksims Šalajevs on 06/06/2024.
//

import UIKit
import SnapKit

class GeneralViewController: UIViewController {
    
    // MARK: - GUI Variables
    
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
    
        
        
        return searchBar
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let width = (view.frame.width - 15) / 2
        
        layout.itemSize = CGSize(width: width, height: width)
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        
        
        
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height - searchBar.frame.height), collectionViewLayout: layout)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        return collectionView
    }()
    
    //MARK: - Properties
    
    
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
        
        
    }
    
    //MARK: - Methods
    
    //MARK: - Private methods
    
    private func setupUI() {
        
        view.backgroundColor = .white
        view.addSubview(searchBar)
        view.addSubview(collectionView)
        
        collectionView.register(GeneralCollectionViewCell.self, forCellWithReuseIdentifier: "GeneralCollectionViewCell")
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        searchBar.snp.makeConstraints { $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide) }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(searchBar.snp.bottom)
            $0.leading.trailing.equalToSuperview().inset(5)
            $0.bottom.equalTo(view.safeAreaLayoutGuide) }
        
    }


}
//MARK: - UICollectionViewDataSource

extension GeneralViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        15
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GeneralCollectionViewCell", for: indexPath) as? GeneralCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        return cell
    }
    
    
}

//MARK: - UICollectionViewDelegate

extension GeneralViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let controller = GeneralDescriptionViewController()
        navigationController?.pushViewController(controller, animated: true)

    }
}

