//
//  ViewController.swift
//  LifeCycle
//
//  Created by 신승재 on 2023/07/06.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("VC - 1 " + #function)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("VC - 1 " + #function)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("VC - 1 " + #function)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("VC - 1 " + #function)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("VC - 1 " + #function)
    }

}

