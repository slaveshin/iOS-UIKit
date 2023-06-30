//
//  ViewController.swift
//  NextVC
//
//  Created by 신승재 on 2023/06/29.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // 1) 코드로 화면 이동(단, 다음 화면이 코드로 작성되어 있을때만 가능함)
    @IBAction func codeNextButtonTapped(_ sender: Any) {
        let firstVC = FirstViewController()
        
        firstVC.someString = "아기상어"
        
        firstVC.modalPresentationStyle = .fullScreen
        present(firstVC, animated: true, completion: nil)
    }
    
    // 2) 코드로 스토리보드 객체를 생성해서, 화면이동
    @IBAction func storyboardWithCodeButtonTapped(_ sender: Any) {
        if let secondVC = storyboard?
            .instantiateViewController(withIdentifier: "secondVC") as? SecondViewController {
            secondVC.someString = "아빠상어"
            present(secondVC, animated: true, completion: nil)
        }
    }
    
    @IBAction func storyboardWithSegueButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "toThirdVC", sender: self)
    }
}

