//
//  MoviesView.swift
//  Movies
//
//  Created by MacBookPro on 15/8/18.
//  Copyright © 2018 MacBookPro. All rights reserved.
//

import UIKit
import SDWebImage

class MoviesView: UICollectionViewCell {
    
    var homeMovieData: Results? {
        didSet {
            let imgUrl = "https://image.tmdb.org/t/p/w1280/" + (homeMovieData?.poster_path ?? "")
            movieImage.sd_setImage(with: URL(string: imgUrl))
            movieTitle.text = homeMovieData?.title ?? ""
            ratingNumber.text = "\(homeMovieData?.vote_average ?? 0)"
        }
    }
    
    let movieImage: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        return img
    }()
    
    let ratingView: UIView = {
        let view = UIView()
        view.backgroundColor = Color.secondaryButton
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 20
        return view
    }()
    
    let ratingNumber: UILabel = {
        let number = UILabel()
        number.textColor = .black
        return number
    }()
    
    let movieTitle: UILabel = {
        let title = UILabel()
        title.textColor = .white
        title.font = UIFont.systemFont(ofSize: 13)
        title.numberOfLines = -2
        title.backgroundColor = Color.primaryColor
        return title
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(movieTitle)
        movieTitle.anchor(top: nil, paddingTop: 0, bottom: bottomAnchor, paddingBottom: 0, left: leftAnchor, paddingLeft: 0, right: rightAnchor, paddingRight: 0, width: 0, height: 40)
        
        addSubview(movieImage)
        movieImage.anchor(top: topAnchor, paddingTop: 0, bottom: movieTitle.topAnchor, paddingBottom: 0, left: leftAnchor, paddingLeft: 0, right: rightAnchor, paddingRight: 0, width: 0, height: 0)
        
        addSubview(ratingView)
        ratingView.anchor(top: nil, paddingTop: 0, bottom: movieTitle.topAnchor, paddingBottom: 10, left: nil, paddingLeft: 0, right: rightAnchor, paddingRight: 10, width: 40, height: 40)
        
        ratingView.addSubview(ratingNumber)
        ratingNumber.anchor(top: nil, paddingTop: 0, bottom: nil, paddingBottom: 0, left: nil, paddingLeft: 0, right: nil, paddingRight: 0, width: 0, height: 0)
        ratingNumber.centerXAnchor.constraint(equalTo: ratingView.centerXAnchor).isActive = true
        ratingNumber.centerYAnchor.constraint(equalTo: ratingView.centerYAnchor).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
