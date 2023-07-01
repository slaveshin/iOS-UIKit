//
//  ViewController.swift
//  BMI
//
//  Created by 신승재 on 2023/06/30.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    
    var bmi: Double?
    var color: UIColor?
    var advice: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeUI()
    }
    
    func makeUI() {
        heightTextField.delegate = self
        weightTextField.delegate = self
        
        mainLabel.text = "키와 몸무게를 입력해주세요"
        heightTextField.placeholder = "cm"
        weightTextField.placeholder = "kg"
    }
    
    @IBAction func calButtonTapped(_ sender: Any) {
        guard let height = heightTextField.text,
              let weight = weightTextField.text else { return }
        
        self.bmi = calBMI(height: height, weight: weight)
        self.color = getBackgroundColor()
        self.advice = getAdvice()
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if heightTextField.text == "" || weightTextField.text == "" {
            mainLabel.text = "키와 몸무게를 입력하셔야 합니다!"
            mainLabel.textColor = .red
            return false
        }
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSecondVC" {
           let secondVC = segue.destination as! SecondViewController
            secondVC.bmi = self.bmi
            secondVC.color = self.color
            secondVC.advice = self.advice
        }
    }
    
    func calBMI(height: String, weight: String) -> Double {
        guard let h = Double(height), let w = Double(weight) else { return 0.0 }
        var bmi = w / (h * h) * 10000
        bmi = round(bmi * 10) / 10
        return bmi
    }
    
    func getBackgroundColor() -> UIColor {
        guard let bmi = bmi else {return UIColor.black }
        
        switch bmi {
        case ..<18.6:
            return #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        case 18.6..<23.0:
            return #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        case 23.0..<25.0:
            return #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        case 25.0..<30.0:
            return #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        case 30.0...:
            return #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        default:
            return UIColor.black
        }
    }
    
    func getAdvice() -> String {
        guard let bmi = bmi else { return "" }
        
        switch bmi {
        case ..<18.6:
            return "저체중"
        case 18.6..<23.0:
            return "표준"
        case 23.0..<25.0:
            return "과체중"
        case 25.0..<30.0:
            return "중도비만"
        case 30.0...:
            return "고도비만"
        default:
            return ""
        }
    }
}

extension ViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // 숫자만 입력이 가능하도록
        if Int(string) != nil || string == "" {
            return true
        }
        return false
    }
    
    // return시 다음 텍스트필드로 커서 이동
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if heightTextField.text != "", weightTextField.text != "" {
            weightTextField.resignFirstResponder()
            return true
        } else if heightTextField.text != "" {
            weightTextField.becomeFirstResponder()
            return true
        }
        return false
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        heightTextField.resignFirstResponder()
        weightTextField.resignFirstResponder()
    }
}
