//
//  FourthViewController.swift
//  NextVC
//
//  Created by 신승재 on 2023/06/30.
//

import UIKit

class FourthViewController: UIViewController {
    
    
    @IBOutlet weak var mainLabel: UILabel!
    
    var someString: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        mainLabel.text = someString
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        dismiss(animated: true)
    }
}
