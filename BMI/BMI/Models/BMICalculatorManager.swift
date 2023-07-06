//
//  BMICalculatorManager.swift
//  BMI
//
//  Created by 신승재 on 2023/07/05.
//

import Foundation
import UIKit

struct BMICalCulatorManager {
    
    var bmi: BMI?
    
    mutating func getBMI(height: String, weight: String) -> BMI {
        
        calBMI(height: height, weight: weight)
        
        return bmi ?? BMI(value: 0.0, matchColor: UIColor.white, advice: "error")
    }
    
    mutating private func calBMI(height: String, weight: String) {
        guard let h = Double(height),
              let w = Double(weight) else {
            bmi = BMI(value: 0.0, matchColor: UIColor.white, advice: "error")
            return
        }
        
        var bmiNum = w / (h * h) * 10000
        bmiNum = round(bmiNum * 10) / 10
    
        switch bmiNum {
        case ..<18.6:
            let color = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
            bmi = BMI(value: bmiNum, matchColor: color, advice: "저체중")
        case 18.6..<23.0:
            let color = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
            bmi = BMI(value: bmiNum, matchColor: color, advice: "표준")
        case 23.0..<25.0:
            let color = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
            bmi = BMI(value: bmiNum, matchColor: color, advice: "과체중")
        case 25.0..<30.0:
            let color = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
            bmi = BMI(value: bmiNum, matchColor: color, advice: "중도비만")
        case 30.0...:
            let color = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
            bmi = BMI(value: bmiNum, matchColor: color, advice: "고도비만")
        default:
            let color = UIColor.black
            bmi = BMI(value: bmiNum, matchColor: color, advice: "오류")
        }
    }
}
