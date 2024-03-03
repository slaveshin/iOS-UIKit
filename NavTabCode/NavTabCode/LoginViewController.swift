//
//  ViewController.swift
//  NavTabCode
//
//  Created by 신승재 on 3/3/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    // 로그인 버튼
    private lazy var loginButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .blue
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
    }
    
    func makeUI() {
        view.backgroundColor = .white
        
        view.addSubview(loginButton)
        
        NSLayoutConstraint.activate([
            loginButton.widthAnchor.constraint(equalToConstant: 120),
            loginButton.heightAnchor.constraint(equalToConstant: 45),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc func loginButtonTapped() {
        // 전화면의 isLoggedIn속성에 접근하기 ⭐️
        if let presentingVC = presentingViewController { // 옵셔널 바인딩
        let tabBarCon = presentingVC as! UITabBarController   // 탭바에 접근하기
        let nav = tabBarCon.viewControllers?[0] as! UINavigationController  // 네비게이션바에 접근하기
        let firstVC = nav.viewControllers[0] as! FirstViewController  // FirstVC에 접근하기
        firstVC.isLoggedIn.toggle()  // 로그인 되었다고 상태 변화시키기 (실제 앱에서 이렇게 구현할 일은 없음)
      }
        
        dismiss(animated: true)
    }
}

