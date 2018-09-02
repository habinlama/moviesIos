//
//  ViewControllerExtension.swift
//  Movies
//
//  Created by Sujal on 9/2/18.
//  Copyright © 2018 MacBookPro. All rights reserved.
//

import UIKit

extension UIViewController {
    func setupNavigation() {
        navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationItem.largeTitleDisplayMode = .never
        navigationController?.navigationBar.barTintColor = Color.primaryColor
        navigationController?.navigationBar.isTranslucent = false
        
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
    }
}
