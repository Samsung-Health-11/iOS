//
//  YinHomeViewController.swift
//  SamsungHealth-iOS
//
//  Created by 이경민 on 2022/05/14.
//

import UIKit

class YinHomeViewController: UIViewController {
    
    // MARK: - Properties
    
    var weight = Double(0.0)
    
    // MARK: - IBOutlet
    
    @IBOutlet var titleLabels: [UILabel]!
    @IBOutlet var h1Labels: [UILabel]!
    @IBOutlet var b2Labels: [UILabel]!
    @IBOutlet var c1Labels: [UILabel]!
    
    @IBOutlet var stepCountLabels: [UILabel]!
    @IBOutlet weak var stepTargetLabel: UILabel!
    @IBOutlet weak var stepTimeLabel: UILabel!
    @IBOutlet weak var stepActivityLabel: UILabel!
    @IBOutlet weak var stepPercentLabel: UILabel!
    @IBOutlet weak var calIntakeLabel: UILabel!
    @IBOutlet weak var calTargetLabel: UILabel!
    @IBOutlet weak var sleepHourLabel: UILabel!
    @IBOutlet weak var sleepMinuteLabel: UILabel!
    @IBOutlet weak var sleepTimeLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var waterLabel: UILabel!
    
    @IBOutlet weak var waterMinusButton: UIButton!
    
    // MARK: - VC Life Cycle (or Cell Life Cycle)
    
    override func viewWillAppear(_ animated: Bool) {
        getHealth()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    // MARK: - Function
    
    private func setUI() {
        setFont()
    }
    
    private func setFont() {
        titleLabels.forEach { $0.font = .NotoSans(.medium, size: 15)}
        h1Labels.forEach { $0.font = .SshFontH1 }
        b2Labels.forEach { $0.font = .SshFontB2 }
        c1Labels.forEach { $0.font = .SshFontC1 }
    }
    
    func setData(_ data: YinHealthData) {
        stepCountLabels.forEach() { $0.text = "\(data.step.count)" }
        stepTargetLabel.text = "/\(data.step.target)"
        stepPercentLabel.text = "\(data.step.percent)%"
        stepTimeLabel.text = "\(data.step.time)"
        stepActivityLabel.text = "\(data.step.activity)"
        calIntakeLabel.text = "\(data.calorie.intake)"
        calTargetLabel.text = "/\(data.calorie.target)kcal"
        sleepHourLabel.text = "\(data.sleep.hour)"
        sleepMinuteLabel.text = "\(data.sleep.minute)"
        sleepTimeLabel.text = "\(data.sleep.time)"
        weight = data.weight ?? 0.0
        weightLabel.text = "\(weight)"
        waterLabel.text = "\(data.water)"
    }
    
    func setWaterBtn(_ water: Int) {
        if (water == 0) {
            waterMinusButton.setImage(Const.Image.sshMinusButtonOff, for: .normal)
            waterMinusButton.isEnabled = false
        } else {
            waterMinusButton.setImage(Const.Image.sshMinusButtonOn, for: .normal)
            waterMinusButton.isEnabled = true
        }
    }

    // MARK: - IBAction
    
    @IBAction func weightBtnDidTap(_ sender: Any) {
        guard let weightVC = UIStoryboard(name: Const.Storyboard.YinWeight, bundle: nil).instantiateViewController(withIdentifier: Const.ViewController.YinWeightViewController) as? YinWeightViewController else { return }
        weightVC.modalPresentationStyle = .fullScreen
        weightVC.weight = weight
        present(weightVC, animated: true)
    }
    
    
    @IBAction func waterMinusBtnDidTap(_ sender: Any) {
        putWater(YinWaterRequestModel(type: "-"))
    }
    
    @IBAction func waterPlusBtnDidTap(_ sender: Any) {
        putWater(YinWaterRequestModel(type: "+"))
    }
    
}
