//
//  MoviesController.swift
//  Movies
//
//  Created by MacBookPro on 15/8/18.
//  Copyright © 2018 MacBookPro. All rights reserved.
//

import UIKit
import SVProgressHUD

class MoviesController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    
    var movieListData = [Results]()
    // For Pagination
    var startIndex = 1
    var performPagination = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = .white
        
        navigationItem.title = "Home"
        self.setupNavigation()
        
        collectionView?.register(MoviesView.self, forCellWithReuseIdentifier: cellId)
        getHomeMovieList()
    }
    
    fileprivate func getHomeMovieList() {
        SVProgressHUD.show()
        
        HomePageService.shared.fetchHomeMovieList(url: ApiEndPoints.getHomeMovies(page: startIndex), method: .get, parameters: nil) { (movieList) in
            guard let results = movieList.results else { return }
            
            if results.count == 0 {
                self.performPagination = false
            }
            
            for data in results {
                self.movieListData.append(data)
            }
            DispatchQueue.main.async {
                self.collectionView?.reloadData()
                SVProgressHUD.dismiss()
            }
        }
    }
}

extension MoviesController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieListData.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MoviesView
        cell.homeMovieData = movieListData[indexPath.row]
        
        cell.contentView.layer.cornerRadius = 8
        cell.contentView.layer.borderWidth = 2
        cell.contentView.layer.borderColor = UIColor.black.cgColor
        cell.contentView.layer.masksToBounds = false
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.width / 2) - 3 - 10 - 10, height: 260)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 13
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(10, 15, 20, 15)
    }
    
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        let count = movieListData.count
        let lastItem = count - 1
        
        if indexPath.row == lastItem && performPagination {
            startIndex += 1
            print("Last row reached")
            getHomeMovieList()
        }
    }
}
