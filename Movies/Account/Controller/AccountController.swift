//
//  AccountController.swift
//  Movies
//
//  Created by MacBookPro on 17/8/18.
//  Copyright © 2018 MacBookPro. All rights reserved.
//

import UIKit
import ActionSheetPicker_3_0
import SVProgressHUD

class AccountController: UIViewController {
    
    let accountView: AccountView = {
        let view = AccountView()
        return view
    }()
    
    var selectedTopicIndex = 0
    var favouriteMovieData = [String]()
    var favouriteMovieId = [String]()
    
    var selectedFavouriteId = "0" {
        didSet {

        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        accountView.accountController = self
        navigationItem.title = "Account"
        setupNavigation()
        accountView.favouriteMovieButton.addTarget(self, action: #selector(handleFavouriteButton), for: .touchUpInside)
        getFavouriteMovie()
        SVProgressHUD.show()
    }
    
    fileprivate func getFavouriteMovie() {
        PopularService.shared.fetchPopularMovieList(url: ApiEndPoints.getPopularMovies(popularPage: 1), method: .get, parameters: nil) { (favMovie) in
            self.favouriteMovieData = []
            self.favouriteMovieId = []
            for movie in favMovie.results! {
                self.favouriteMovieData.append(movie.title!)
                self.favouriteMovieId.append("\(movie.id!)")
                SVProgressHUD.dismiss()
            }
        }
    }
    
    @objc func handleFavouriteButton() {
        let picker = ActionSheetStringPicker(title: "Favourite Movie", rows: favouriteMovieData, initialSelection: selectedTopicIndex, doneBlock: { (picker, indexes, values) in
            guard let topic = values as? String else { return }
            self.selectedFavouriteId = self.favouriteMovieId[indexes]
            self.accountView.favouriteMovieButton.setTitle(topic, for: .normal)
            return
        }, cancel: { (_) in
            return
        }, origin: accountView.favouriteMovieButton)
        picker?.toolbarButtonsColor = Color.primaryColor
        picker?.show()
    }
}
