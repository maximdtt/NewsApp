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
        collectionView.register(DetailsCollectionViewCell.self, forCellWithReuseIdentifier: "DetailsCollectionViewCell")
        
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
        section == 0 ? 1 : 15
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell: UICollectionViewCell?
        if indexPath.section == 0 {

            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GeneralCollectionViewCell", for: indexPath) as? GeneralCollectionViewCell
            
        } else {
          
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailsCollectionViewCell", for: indexPath) as? DetailsCollectionViewCell
            
        }
        
        return cell ?? UICollectionViewCell()
    }
    
    
}

//MARK: - UICollectionViewDelegate

extension TechnologyViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //let controller = NewsViewController()
        //navigationController?.pushViewController(controller, animated: true)

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
