//
//  KmHomeViewController.swift
//  SamsungHealth-iOS
//
//  Created by 이경민 on 2022/05/14.
//

import UIKit

final class KmHomeViewController: UIViewController {
    
    // MARK: - Property
    
    var waterCount: Int = 0
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var waterCountLabel: UILabel!
    @IBOutlet weak var waterMinusButton: UIButton!
    @IBOutlet weak var waterPlusButton: UIButton!
    
    @IBOutlet var componentViewCollection: [UIView]!
    @IBOutlet var titleLabelCollection: [UILabel]!
    
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
        componentViewCollection.forEach {
            $0.layer.cornerRadius = 20
        }
    }
    
    private func setLabelUI() {
        titleLabelCollection.forEach {
            $0.font = .NotoSans(.medium, size: 15)
        }
    }
}
