import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var timerButton: UIButton!
    
    var leftSeconds: Int = 0
    var timer: Timer?
    var buttonState = 0 // 0:시작, 1:일시정지, 2:초기화
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timerButton.layer.cornerRadius = 10
        leftSeconds = 180 // 초기 leftSconds는 항상 180이므로
        updateTimer()
    }
    // segmentValueChange 이벤트 핸들러
    @IBAction func segmentValueChanged(_ sender: Any) {
        // 타이머가 돌고 있을때는 기능 정지
        if timer != nil {
            return
        }
        setTimerMinutes()
    }
    
    // 버튼 클릭 이벤트 핸들러
    @IBAction func buttonClicked(_ sender: Any) {
       
        if buttonState == 0 { // 지금 타이머가 돌기 전이라면
            buttonState = 1
            timerButton.backgroundColor = UIColor.red
            timerButton.setTitle("정지", for: .normal)
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {(t) in
                self.leftSeconds -= 1 // 초당 1씩 빼주기
                self.updateTimer()
            })
        } else if buttonState == 1 { // 지금 타이머가 돌고 있다면
            buttonState = 2
            timer?.invalidate() // 타이머 정지
            timerButton.backgroundColor = UIColor.blue
            timerButton.setTitle("초기화", for: .normal)
        } else { // 지금 타이머 상태가 정지라면
            buttonState = 0
            timer = nil
            timerButton.backgroundColor = UIColor.systemGreen
            timerButton.setTitle("타이머 시작하기", for: .normal)
            // segmentValue에 따라 초기 초 바꿔주기
            setTimerMinutes()
        }
    }
    
    // 타이머 label을 업데이트 해주는 function
    func updateTimer(){
        let minutes = self.leftSeconds / 60
        let seconds = self.leftSeconds % 60
        
        if leftSeconds == 0 {
            timer?.invalidate() // 정지
            timerLabel.text = "시간 끝 !"
            buttonState = 2
            timerButton.backgroundColor = UIColor.blue
            timerButton.setTitle("초기화", for: .normal)
        } else{
            timerLabel.text = String(format: "%02d:%02d", minutes, seconds)
        }
    }
    
    // segmentValue에 따라 타이머 label을 업데이트 해주는 function
    func setTimerMinutes() {
        if segmentControl.selectedSegmentIndex == 0 {
            timerLabel.text = "03:00"
            leftSeconds = 180
        } else if segmentControl.selectedSegmentIndex == 1 {
            timerLabel.text = "04:00"
            leftSeconds = 240
        } else {
            timerLabel.text = "05:00"
            leftSeconds = 300
        }
    }
}

