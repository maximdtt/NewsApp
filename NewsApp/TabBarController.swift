//
//  TabBarController.swift
//  NewsApp
//
//  Created by Maksims Šalajevs on 07/06/2024.
//

import UIKit

final class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.tintColor = .black
        
        setupViewControllers()
        
    }
    
    private func setupViewControllers() {

        viewControllers = [
            setupNavigationController(rootViewController: GeneralViewController(), title: "General", image: UIImage(systemName: "globe") ?? UIImage.add),
            setupNavigationController(rootViewController: TechnologyViewController(), title: "Technology", image: UIImage(systemName: "laptopcomputer") ?? UIImage.add),
            setupNavigationController(rootViewController: SportViewController(), title: "Sport", image: UIImage(systemName: "soccerball") ?? UIImage.add)
                
                
        ]
    }
    
    private func setupNavigationController(rootViewController: UIViewController,
                                           title: String,
                                           image: UIImage) -> UINavigationController {
        
        let navigationController = UINavigationController(rootViewController: rootViewController)
        navigationController.tabBarItem.title = title
        navigationController.tabBarItem.image = image
        rootViewController.navigationItem.title = title
        //navigationController.navigationBar.prefersLargeTitles = true
        
        return navigationController
        
    }
    
}
