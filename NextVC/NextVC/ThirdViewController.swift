//
//  ThirdViewController.swift
//  NextVC
//
//  Created by 신승재 on 2023/06/30.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func backButtonTapped(_ sender: Any) {
        dismiss(animated: true)
    }
    

}
