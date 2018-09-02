//
//  PopularController.swift
//  Movies
//
//  Created by MacBookPro on 15/8/18.
//  Copyright © 2018 MacBookPro. All rights reserved.
//

import UIKit
import SVProgressHUD

class PopularController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    
    var popularMovieListData = [PopularResults]()
    
    var startIndex = 1
    var pagingation = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = .white
        navigationItem.title = "Popular Movies"
        setupNavigation()
        
        collectionView?.register(PopularView.self, forCellWithReuseIdentifier: cellId)
        getPopularMovies()
    }
    
    fileprivate func getPopularMovies() {
        SVProgressHUD.show()
        PopularService.shared.fetchPopularMovieList(url: ApiEndPoints.getPopularMovies(popularPage: startIndex), method: .get, parameters: nil) { (popularList) in
            
            guard let moviesList = popularList.results else { return }
            
            if moviesList.count == 0 {
                self.pagingation = false
            }
            
            for movies in moviesList {
                self.popularMovieListData.append(movies)
            }
            DispatchQueue.main.async {
                self.collectionView?.reloadData()
                SVProgressHUD.dismiss()
            }
        }
    }
}

extension PopularController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return popularMovieListData.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! PopularView
        cell.popularMovieData = popularMovieListData[indexPath.item]
        
        cell.contentView.layer.cornerRadius = 2.0
        cell.contentView.layer.borderWidth = 1.0
        cell.contentView.layer.borderColor = UIColor.clear.cgColor
        cell.contentView.layer.masksToBounds = true;
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
        let count = popularMovieListData.count
        let lastItem = count - 1
        
        if indexPath.row == lastItem && pagingation {
            startIndex += 1
            print("Last row reached")
            getPopularMovies()
        }
    }
}
