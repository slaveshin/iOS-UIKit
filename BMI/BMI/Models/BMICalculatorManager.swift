//
//  BMICalculatorManager.swift
//  BMI
//
//  Created by 신승재 on 2023/07/05.
//

import Foundation
import UIKit

struct BMICalCulatorManager {
    
    var bmi: Double?
    var color: UIColor?
    var advice: String?
    
    func getBMIResult() -> Double? {
        return bmi
    }
    
    mutating func calBMI(height: String, weight: String) {
        guard let h = Double(height), let w = Double(weight) else { return }
        var bmi = w / (h * h) * 10000
        bmi = round(bmi * 10) / 10
        self.bmi = bmi
    }
    
    func getBackgroundColor() -> UIColor {
        guard let bmi = bmi else { return UIColor.black }
        
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
