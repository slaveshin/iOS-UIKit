//
//  SecondViewController.swift
//  LifeCycle
//
//  Created by 신승재 on 2023/07/06.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("---> VC - 2 " + #function)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("---> VC - 2 " + #function)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("---> VC - 2 " + #function)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("---> VC - 2 " + #function)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("---> VC - 2 " + #function)
    }

    @IBAction func backButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        print("---> VC - 2 메모리에서 내려감")
    }
}
