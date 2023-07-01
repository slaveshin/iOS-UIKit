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
    
    var bmi: Double?
    var color: UIColor?
    var advice: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        makeUI()
    }
    
    func makeUI() {
        bmiNumberLabel.clipsToBounds = true
        bmiNumberLabel.layer.cornerRadius = 5
        
        guard let bmi = bmi else { return }
        bmiNumberLabel.text = String(bmi)
        bmiNumberLabel.backgroundColor = color
        
        bmiNumberLabel.textColor = .white
        
        adviceLabel.text = advice
    }
    
    
    @IBAction func backButtonTapped(_ sender: Any) {
        dismiss(animated: true)
    }
}
