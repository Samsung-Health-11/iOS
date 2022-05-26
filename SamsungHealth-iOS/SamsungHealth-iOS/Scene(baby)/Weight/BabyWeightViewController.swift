//
//  BabyWeightViewController.swift
//  SamsungHealth-iOS
//
//  Created by 이경민 on 2022/05/14.
//

import UIKit

protocol BabyWeightViewContollerDelegate {
    func recordWeight(weight: Float)
}

class BabyWeightViewController: UIViewController {

    // MARK: - Properties
    var delegate: BabyWeightViewContollerDelegate?
    var weight: Float = 0.0
    
    // MARK: - @IBOutlet
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet var DateLabel: [UILabel]!
    @IBOutlet var subTitleLabel: [UILabel]!
    @IBOutlet var explainLabel: [UILabel]!
    @IBOutlet weak var buttonView: UIView!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var weightPickerView: UIPickerView!
    @IBOutlet weak var bottomView: UIView!

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setHierarchy()
        setFont()
        setDelegate()
    }
    
    // MARK: - Functions
    func setFont() {
        titleLabel.font = .SshFontH2
        DateLabel.forEach { $0.font = .SshFontB1 }
        subTitleLabel.forEach { $0.font = .NotoSans(.medium, size: 15) }
        explainLabel.forEach{ $0.font = .SshFontB3 }
    }
    
    func setDelegate() {
        weightPickerView.delegate = self
        weightPickerView.dataSource = self
    }
    
    func setHierarchy(){
        self.view.bringSubviewToFront(bottomView)
    }
    
    // MARK: - @IBAction
    @IBAction func saveButtonDidTap(_ sender: Any) {
        delegate?.recordWeight(weight: weight)
        self.dismiss(animated: true, completion: nil)
    }
}

extension BabyWeightViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in weightPickerView: UIPickerView) -> Int {
        return 3
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component{
        case 0:
            return 200
        case 1:
            return 1
        default:
            return 10
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        pickerView.subviews.forEach {
            $0.backgroundColor = .clear
        }
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 60))
        label.textAlignment = .center
        label.font = .SshFontH1
        switch (component) {
            case 1: label.text = "."
            default: label.text = "\(row)"
        }
        return label
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 60
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 30
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        weight = Float(pickerView.selectedRow(inComponent: 0))
        weight += (Float(pickerView.selectedRow(inComponent: 2)) * 0.1)
    }
}



