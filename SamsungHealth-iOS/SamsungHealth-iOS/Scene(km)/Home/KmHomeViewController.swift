//
//  KmHomeViewController.swift
//  SamsungHealth-iOS
//
//  Created by 이경민 on 2022/05/14.
//

import UIKit

final class KmHomeViewController: UIViewController {
    
    // MARK: - Property
    
    var weight: Float?
    var waterCount: Int = 0
    
    // MARK: - IBOutlet
    
    ///walk
    @IBOutlet weak var walkCountLabel: UILabel!
    @IBOutlet weak var walkTargetLabel: UILabel!
    @IBOutlet weak var walkPercentLabel: UILabel!
    
    ///daily activity
    @IBOutlet weak var activityWalkLabel: UILabel!
    @IBOutlet weak var activityHourLabel: UILabel!
    @IBOutlet weak var activityCalorieLabel: UILabel!
    
    ///food
    @IBOutlet weak var foodIntakeLabel: UILabel!
    @IBOutlet weak var foodTargetLabel: UILabel!
    
    ///sleep
    @IBOutlet weak var sleepHourLabel: UILabel!
    @IBOutlet weak var sleepMinuteLabel: UILabel!
    @IBOutlet weak var sleepTimeLabel: UILabel!
    @IBOutlet weak var sleepBarView: UIView!
    
    ///weight
    @IBOutlet weak var weightLabel: UILabel!
    
    ///water
    @IBOutlet weak var waterCountLabel: UILabel!
    @IBOutlet weak var waterMinusButton: UIButton!
    @IBOutlet weak var waterPlusButton: UIButton!
    
    ///IBOutlet Collection
    @IBOutlet var componentViewCollection: [UIView]!
    @IBOutlet var titleLabelCollection: [UILabel]!
    @IBOutlet var unitLabelCollection: [UILabel]!
    @IBOutlet var resultLabelCollection: [UILabel]!
    
    // MARK: - VC Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setWaterComponent(water: waterCount)
    }
    
    // MARK: - Function
    
    private func setUI() {
        setViewUI()
        setLabelUI()
    }
    
    private func setWaterComponent(water: Int) {
        waterCountLabel.text = "\(waterCount)"
        waterMinusButton.isSelected = (waterCount == 0)
    }
    
    // MARK: - IBAction
    
    @IBAction func writeWeightButtonDidTap(_ sender: Any) {
        guard let weightVC = UIStoryboard(name: Const.Storyboard.KmWeight, bundle: nil).instantiateViewController(withIdentifier: Const.ViewController.KmWeightViewController) as? KmWeightViewController else { return }
        weightVC.modalPresentationStyle = .fullScreen
        present(weightVC, animated: true)
    }
    
    @IBAction func waterCountButtonDidTap(_ sender: UIButton) {
        waterCount = (sender == waterPlusButton) ? waterCount + 1 : ( waterCount >= 1 ? waterCount - 1 : 0)
        setWaterComponent(water: waterCount)
    }
}

extension KmHomeViewController {
    private func setViewUI() {
        componentViewCollection.forEach { $0.layer.cornerRadius = 20 }
        sleepBarView.layer.cornerRadius = 5
    }
    
    private func setLabelUI() {
        titleLabelCollection.forEach { $0.font = .NotoSans(.medium, size: 15) }
        unitLabelCollection.forEach { $0.font = .SshFontB2 }
        resultLabelCollection.forEach { $0.font = .SshFontH1 }
        [walkPercentLabel, sleepTimeLabel].forEach { $0?.font = .SshFontC1 }
        [activityWalkLabel, activityHourLabel ,activityCalorieLabel].forEach { $0?.font = .SshFontB1 }
    }
}
