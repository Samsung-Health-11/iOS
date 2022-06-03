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
    @IBOutlet weak var stepCountLabel: UILabel!
    @IBOutlet weak var stepTargetLabel: UILabel!
    @IBOutlet weak var stepPercentLabel: UILabel!
    @IBOutlet weak var stepCount_1Label: UILabel!
    @IBOutlet weak var stepTimeLabel: UILabel!
    @IBOutlet weak var stepActivityLabel: UILabel!
    @IBOutlet weak var calorieIntakeLabel: UILabel!
    @IBOutlet weak var calorieTargetLabel: UILabel!
    @IBOutlet weak var sleepHourLabel: UILabel!
    @IBOutlet weak var sleepMinuteLabel: UILabel!
    @IBOutlet weak var sleepTimeLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var waterLabel: UILabel!
    @IBOutlet weak var excerciseRecordButton: UIButton!
    @IBOutlet var bigLabel: [UILabel]!
    @IBOutlet var smallLabel: [UILabel]!
    @IBOutlet var detailLabel: [UILabel]!
    @IBOutlet weak var waterMinusButton: UIButton!
    
    // MARK: - VC Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setFont()
    }
    
    override func viewWillAppear(_ animated: Bool) {
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
    
    func setWaterButton(_ water: Int){
        if water == 0{
            waterMinusButton.setImage(Const.Image.sshMinusButtonOff, for: .normal)
            waterMinusButton.isEnabled = false
        }
        else{
            waterMinusButton.setImage(Const.Image.sshMinusButtonOn, for: .normal)
            waterMinusButton.isEnabled = true
        }
    }

    // MARK: - @IBAction
    @IBAction func weightbtnDidTap(_ sender: Any) {
        guard let babyWeightVC = UIStoryboard(name: Const.Storyboard.BabyWeight, bundle: nil).instantiateViewController(withIdentifier: Const.ViewController.BabyWeightViewController) as? BabyWeightViewController else { return }
        babyWeightVC.modalTransitionStyle = .crossDissolve
        babyWeightVC.modalPresentationStyle = .fullScreen
        self.present(babyWeightVC, animated: true, completion: nil)
    }
    
    @IBAction func waterMinusButtonDidTap(_ sender: Any) {
        modifyWaterData(modifyType: "-")
    }
    
    @IBAction func waterPlusButtonDidTap(_ sender: Any) {
        modifyWaterData(modifyType: "+")
    }
}

