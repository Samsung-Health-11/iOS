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

    // MARK: - @IBAction
    @IBAction func weightbtnDidTap(_ sender: Any) {
        guard let babyWeightVC = UIStoryboard(name: "BabyWeight", bundle: nil).instantiateViewController(withIdentifier: "BabyWeightViewController") as? BabyWeightViewController else { return }
        babyWeightVC.modalTransitionStyle = .crossDissolve
        babyWeightVC.modalPresentationStyle = .fullScreen
        self.present(babyWeightVC, animated: true, completion: nil)
    }
}

