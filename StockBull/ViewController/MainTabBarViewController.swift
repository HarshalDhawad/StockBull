//
//  MainTabViewController.swift
//  StockBull
//
//  Created by Harshal Dhawad on 29/01/26.
//

import UIKit

class MainTabViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
        configureTabBarAppearance()
    }
    
    func setupTabs() {
        let homeViewController = createNavController(
            viewController: HomeViewController(),
            title: "Home",
            imageName: "house"
        )
        
        let xploreViewController = createNavController(
            viewController: ExploreViewController(),
            title: "Explore",
            imageName: "magnifyingglass"
        )
        
        let portfolioViewController = createNavController(
            viewController: PortfolioViewController(),
            title: "Portfolio",
            imageName: "chart.line.uptrend.xyaxis"
        )
        
        let newsViewController = createNavController(
            viewController: NewsViewController(),
            title: "News",
            imageName: "doc.text.image"
        )
        
        self.viewControllers = [homeViewController, xploreViewController, portfolioViewController, newsViewController]
    }
    
    private func createNavController(viewController: UIViewController, title: String, imageName: String) -> UIViewController {
        viewController.title = title
        
        let navViewController = UINavigationController(rootViewController: viewController)
        
        // Set the Tab Bar Item specifically for the Navigation Controller
        navViewController.tabBarItem.title = title
        navViewController.tabBarItem.image = UIImage(systemName: imageName)
        
        let navBackButton = UIBarButtonItem(title: "back", image: UIImage(systemName: "chevron.backward"), target: nil, action: nil)
        viewController.navigationItem.leftBarButtonItem = navBackButton
        
        return navViewController
    }
    
    func configureTabBarAppearance() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .systemBackground 
        
        appearance.shadowColor = .systemGray4
        
        tabBar.standardAppearance = appearance
        tabBar.scrollEdgeAppearance = appearance
        
        tabBar.tintColor = .systemGreen
        tabBar.unselectedItemTintColor = .systemGray
        
        tabBar.layer.shadowColor = UIColor.black.cgColor
        tabBar.layer.shadowOffset = CGSize(width: 0, height: -4)
        tabBar.layer.shadowRadius = 8
        tabBar.layer.shadowOpacity = 0.12
        
        tabBar.layer.masksToBounds = false
    }
}
