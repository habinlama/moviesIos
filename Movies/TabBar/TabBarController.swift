//
//  TabBarController.swift
//  Movies
//
//  Created by MacBookPro on 15/8/18.
//  Copyright © 2018 MacBookPro. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.barTintColor = Color.primaryColor
        setupViewControllers()
        self.tabBar.tintColor = .black
    }
    
    fileprivate func setupViewControllers() {
        
        let homeLayout = UICollectionViewFlowLayout()
        let homeController = UINavigationController(rootViewController: MoviesController(collectionViewLayout: homeLayout))
        homeController.tabBarItem.title = "Home"
        homeController.tabBarItem.selectedImage = #imageLiteral(resourceName: "home_active").withRenderingMode(.alwaysOriginal)
        homeController.tabBarItem.image = #imageLiteral(resourceName: "home_inactive").withRenderingMode(.alwaysOriginal)
        
        let popularLayout = UICollectionViewFlowLayout()
        let popularController = UINavigationController(rootViewController: PopularController(collectionViewLayout: popularLayout))
        popularController.tabBarItem.title = "Popular"
        popularController.tabBarItem.selectedImage = #imageLiteral(resourceName: "wishlist_active").withRenderingMode(.alwaysOriginal)
        popularController.tabBarItem.image = #imageLiteral(resourceName: "wishlist_inactive").withRenderingMode(.alwaysOriginal)
        
        let accountController = UINavigationController(rootViewController: AccountController())
        accountController.tabBarItem.title = "Account"
        accountController.tabBarItem.selectedImage = #imageLiteral(resourceName: "account_active").withRenderingMode(.alwaysOriginal)
        accountController.tabBarItem.image = #imageLiteral(resourceName: "account_inactive").withRenderingMode(.alwaysOriginal)
        
        viewControllers = [homeController, popularController, accountController]
    }
}
