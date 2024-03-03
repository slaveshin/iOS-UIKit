//
//  FirstViewController.swift
//  NavTabCode
//
//  Created by 신승재 on 3/3/24.
//

import UIKit

class FirstViewController: UIViewController {
    
    var isLoggedIn = false

    override func viewDidLoad() {
        super.viewDidLoad()

        makeUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if !isLoggedIn {
            let vc = LoginViewController()
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: false)
        }
    }
    
    func makeUI() {
        view.backgroundColor = .gray
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        
        navigationController?.navigationBar.tintColor = .blue
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        title = "Main"
    }
}
