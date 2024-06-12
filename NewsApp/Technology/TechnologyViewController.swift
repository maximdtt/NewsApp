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
        let width = (view.frame.width - 15) / 2
        
        layout.itemSize = CGSize(width: width, height: width)
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        
        
        
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height), collectionViewLayout: layout)
        
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
        view.addSubview(collectionView)
        
        collectionView.register(GeneralCollectionViewCell.self, forCellWithReuseIdentifier: "GeneralCollectionViewCell")
        
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

extension TechnologyViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let controller = NewsViewController()
        navigationController?.pushViewController(controller, animated: true)

    }
}
