//
//  BabyHomeViewController.swift
//  SamsungHealth-iOS
//
//  Created by 이경민 on 2022/05/14.
//

import UIKit

class BabyHomeViewController: UIViewController {
    
    // MARK: - @IBOutlet
    @IBOutlet var titleLabel: [UILabel]!
    @IBOutlet var daliyActivityLabel: [UILabel]!
    //step
    
    @IBOutlet weak var stepCountLabel: UILabel!
    @IBOutlet weak var stepTargetLabel: UILabel!
    @IBOutlet weak var stepPercentLabel: UILabel!
    @IBOutlet weak var stepCount_1Label: UILabel!
    @IBOutlet weak var stepTimeLabel: UILabel!
    @IBOutlet weak var stepActivityLabel: UILabel!
    //calorie
    @IBOutlet weak var calorieIntakeLabel: UILabel!
    @IBOutlet weak var calorieTargetLabel: UILabel!
    //sleep
    @IBOutlet weak var sleepHourLabel: UILabel!
    @IBOutlet weak var sleepMinuteLabel: UILabel!
    @IBOutlet weak var sleepTimeLabel: UILabel!
    //weight
    @IBOutlet weak var weightLabel: UILabel!
    //water
    @IBOutlet weak var waterLabel: UILabel!
    @IBOutlet weak var excerciseRecordButton: UIButton!
    @IBOutlet var bigLabel: [UILabel]!
    @IBOutlet var smallLabel: [UILabel]!
    @IBOutlet var detailLabel: [UILabel]!
    
    
    
    // MARK: - VC Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setFont()
        loadHealthData()
    }
    
    // MARK: - Functions
    func setFont() {
        titleLabel.forEach{ $0.font = .SshFontH3 }
        daliyActivityLabel.forEach{ $0.font = .SshFontB1 }
        bigLabel.forEach{ $0.font = .SshFontH1 }
        smallLabel.forEach{ $0.font = .SshFontB2 }
        detailLabel.forEach{ $0.font = .SshFontC1 }
    }

    // MARK: - @IBAction
    @IBAction func weightbtnDidTap(_ sender: Any) {
        guard let babyWeightVC = UIStoryboard(name: "BabyWeight", bundle: nil).instantiateViewController(withIdentifier: "BabyWeightViewController") as? BabyWeightViewController else { return }
        babyWeightVC.delegate = self

        babyWeightVC.modalTransitionStyle = .crossDissolve
        babyWeightVC.modalPresentationStyle = .fullScreen

        self.present(babyWeightVC, animated: true, completion: nil)
    }
}

extension BabyHomeViewController: BabyWeightViewContollerDelegate {
    func recordWeight(weight: Float) {
        weightLabel.text = String(weight)
    }
}

extension BabyHomeViewController {

    func loadHealthData() {
        BabyHealthService.shared.loadHealthData() {
            response in
            switch response {
            case .success(let data):
                guard let data = data as? BabyHealthDataClass else { return }
                self.stepCountLabel.text = "\(data.step.count)"
                self.stepTargetLabel.text = "/\(data.step.target)"
                self.stepPercentLabel.text = "\(data.step.percent)%"
                self.stepCount_1Label.text = "\(data.step.count)"
                self.stepTimeLabel.text = "\(data.step.time)"
                self.stepActivityLabel.text = "\(data.step.activity)"
                self.calorieIntakeLabel.text = "\(data.calorie.intake)"
                self.calorieTargetLabel.text = "/\(data.calorie.target)kcal"
                self.sleepHourLabel.text = "\(data.sleep.hour)"
                self.sleepMinuteLabel.text = "\(data.sleep.minute)"
                self.sleepTimeLabel.text = data.sleep.time
                self.weightLabel.text = "\(data.weight)"
                self.waterLabel.text = "\(data.water)"
                print(data)
            default:
                print(response)
            }
        }
    }
}

