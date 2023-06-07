//
//  ViewController.swift
//  SliderTimer
//
//  Created by 신승재 on 2023/06/07.
//
import AVFoundation
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var secondsLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var slider: UISlider!
    
    weak var timer: Timer?
    
    var seconds: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }

    func configureUI() {
        startButton.layer.cornerRadius = 45
        slider.value = 0.5
        seconds = 30
    }
    
    func changeButtonReset() {
        startButton.setTitle("RESET", for: .normal)
        startButton.backgroundColor = UIColor.red
    }
    
    func changeButtonStart() {
        startButton.setTitle("START", for: .normal)
        startButton.backgroundColor = UIColor.systemGreen
    }
    
    func startTimer() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] _ in
            if seconds > 0 {
                seconds -= 1
                slider.value = Float(seconds) / Float(60)
                secondsLabel.text = String(seconds)
                
            } else {
                seconds = 0
                timer?.invalidate()
                AudioServicesPlayAlertSound(SystemSoundID(1322))
            }
        }
    }
    
    func resetTimer() {
        timer?.invalidate()
        slider.setValue(0.5, animated: true)
        secondsLabel.text = "30"
        seconds = 30
    }
    

    @IBAction func sliderChanged(_ sender: UISlider) {
        secondsLabel.text = String(Int(60 * sender.value))
        seconds = Int(60 * sender.value)
    }
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        let buttonTitle = sender.titleLabel?.text
        
        switch buttonTitle {
        case "START":
            changeButtonReset()
            startTimer()
            
        case "RESET":
            changeButtonStart()
            resetTimer()
            
        default:
            break
        }
    }
}

