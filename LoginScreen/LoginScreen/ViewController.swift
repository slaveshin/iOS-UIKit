//
//  ViewController.swift
//  LoginScreen
//
//  Created by 신승재 on 2023/06/10.
//

import UIKit

class ViewController: UIViewController {
    
    let emailTextFieldView = UIView()
    // let emailTextFieldView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeUI()
    }
    
    func makeUI() {
        emailTextFieldView.backgroundColor = UIColor.darkGray
        view.addSubview(emailTextFieldView)
        
        emailTextFieldView.leadingAnchor
        emailTextFieldView.trailingAnchor
        emailTextFieldView.topAnchor
        emailTextFieldView.heightAnchor
    }


}

