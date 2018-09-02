//
//  AccountView.swift
//  Movies
//
//  Created by MacBookPro on 17/8/18.
//  Copyright © 2018 MacBookPro. All rights reserved.
//

import UIKit

class AccountView: UIView {
    
    weak var accountController: AccountController? {
        didSet {
            setupAccountView()
            deviceWidth = accountController?.view.frame.width
            deviceHeight = accountController?.view.frame.height
            setupView()
        }
    }
    
    var deviceWidth: CGFloat?
    var deviceHeight: CGFloat?
    
    let firstName: UITextField = {
        let tf = UITextField()
        tf.placeholder = "First Name"
        return tf
    }()
    
    let lastName: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Last Name"
        return tf
    }()
    
    let mobileNumber: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Mobile Number"
        return tf
    }()
    
    let emailAddress: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Email Address"
        return tf
    }()
    
    let favouriteMovieButton: UIButton = {
        let button = UIButton()
        button.setTitle("Favourite Movie", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    
    fileprivate func setupView() {
        setupFormStackView()
    }
    
    fileprivate func setupFormStackView() {
        let stackView = UIStackView(arrangedSubviews: [firstName, lastName, mobileNumber, emailAddress, favouriteMovieButton])
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 10
        
        addSubview(stackView)
        stackView.anchor(top: safeAreaLayoutGuide.topAnchor, paddingTop: 10, bottom: nil, paddingBottom: 10, left: leftAnchor, paddingLeft: 10, right: rightAnchor, paddingRight: 10, width: 0, height: 450)
    }
    
    fileprivate func setupAccountView() {
        guard let accountController = accountController else { return }
        accountController.view.addSubview(self)
        self.anchor(top: accountController.view.topAnchor, paddingTop: 0, bottom: accountController.view.bottomAnchor, paddingBottom: 0, left: accountController.view.leftAnchor, paddingLeft: 0, right: accountController.view.rightAnchor, paddingRight: 0, width: 0, height: 0)
    }
}
