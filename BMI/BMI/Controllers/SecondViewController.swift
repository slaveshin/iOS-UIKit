//
//  SecondViewController.swift
//  BMI
//
//  Created by 신승재 on 2023/06/30.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var bmiNumberLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    
    var bmi: BMI?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        makeUI()
    }
    
    func makeUI() {
        bmiNumberLabel.clipsToBounds = true
        bmiNumberLabel.layer.cornerRadius = 5
        
        guard let bmi = bmi else { return }
        bmiNumberLabel.text = String(bmi.value)
        bmiNumberLabel.backgroundColor = bmi.matchColor
        
        bmiNumberLabel.textColor = .white
        
        adviceLabel.text = String(bmi.advice)
    }
    
    
    @IBAction func backButtonTapped(_ sender: Any) {
        dismiss(animated: true)
    }
}
