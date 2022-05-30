//
//  YinWeightViewController.swift
//  SamsungHealth-iOS
//
//  Created by 이경민 on 2022/05/14.
//

import UIKit

class YinWeightViewController: UIViewController {
    
    // MARK: - Properties
    
    var weight = Double(0.0)
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet var msgLabels: [UILabel]!
    @IBOutlet var titleLabels: [UILabel]!
    @IBOutlet var typeLabels: [UILabel]!
    
    @IBOutlet weak var weightPickerView: UIPickerView!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var muscleTextField: UITextField!
    @IBOutlet weak var memoTextField: UITextField!
    
    // MARK: - VC Life Cycle (or Cell Life Cycle)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setDelegate()
        setKeyboard()
    }
    
    override func viewWillLayoutSubviews() {
        initPickerView()
    }
    
    // MARK: - Function
    
    private func setUI() {
        setFont()
        setTextFieldUI()
    }
    
    private func setDelegate() {
        setPickerView()
    }
    
    private func setKeyboard() {
        setKeyboardObserver()
        hideKeyboard()
    }
    
    private func setFont() {
        titleLabel.font = .SshFontH2
        dateLabel.font = .SshFontB1
        msgLabels.forEach { $0.font = .SshFontB3 }
        titleLabels.forEach { $0.font = .NotoSans(.medium, size: 15) }
        typeLabels.forEach { $0.font = .NotoSans(.medium, size: 13)}
        memoTextField.font = .NotoSans(.medium, size: 15)
    }
    
    private func initPickerView() {
        weightPickerView.subviews[1].backgroundColor = .clear
        let first = Int(weight)
        let second = Int(weight * 10) - (first * 10)
        weightPickerView.selectRow(first, inComponent: 0, animated: false)
        weightPickerView.selectRow(second, inComponent: 2, animated: false)
    }
    
    private func setPickerView() {
        weightPickerView.delegate = self
        weightPickerView.dataSource = self
    }
    
    private func setTextFieldUI() {
        [weightTextField, muscleTextField].forEach {
            let bottomBorder = CALayer()
            bottomBorder.borderWidth = 1
            bottomBorder.borderColor = UIColor.SshColorGray3.cgColor
            bottomBorder.frame = CGRect(x: 0, y: $0?.frame.height ?? 0, width: $0?.frame.width ?? 0, height: 1)
            $0?.layer.addSublayer(bottomBorder)
        }
    }
    
    // MARK: - IBAction
    @IBAction func cancelWeightBtnDidTap(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func addWeightBtnDidTap(_ sender: Any) {
        postWeight(YinWeightRequestModel(
            weight: weight,
            fatPercent: Double(weightTextField.text ?? ""),
            muscle: Double(muscleTextField.text ?? ""),
            memo: memoTextField.text)
        )
    }
    
}

extension YinWeightViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch (component) {
        case 0: return 100
        case 1: return 1
        default: return 10
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 60))
        label.textAlignment = .center
        label.font = .SshFontH1
        switch (component) {
        case 1: label.text = "."
        default: label.text = "\(row)"
        }
        return label
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 50
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        weight = Double(pickerView.selectedRow(inComponent: 0))
        weight += (Double(pickerView.selectedRow(inComponent: 2)) * 0.1)
    }
}
