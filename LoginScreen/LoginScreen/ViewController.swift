//
//  ViewController.swift
//  LoginScreen
//
//  Created by 신승재 on 2023/06/10.
//

import UIKit

class ViewController: UIViewController {
    
    let emailTextFieldView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.darkGray
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeUI()
    }
    
    func makeUI() {
        view.addSubview(emailTextFieldView)
        
        // 자동 오토레이아웃 끄기
        emailTextFieldView.translatesAutoresizingMaskIntoConstraints = false
        
        // 수동으로 오토레이아웃 잡기
        emailTextFieldView.leadingAnchor
            .constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        emailTextFieldView.trailingAnchor
            .constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        emailTextFieldView.topAnchor
            .constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        emailTextFieldView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
    }


}

