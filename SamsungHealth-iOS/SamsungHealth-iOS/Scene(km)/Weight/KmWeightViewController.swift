//
//  KmWeightViewController.swift
//  SamsungHealth-iOS
//
//  Created by 이경민 on 2022/05/14.
//

import UIKit

final class KmWeightViewController: UIViewController {
    
    // MARK: - Properties
    
    var weight: Float = 0.0
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var pickerView: UIPickerView!
    
    @IBOutlet var componentViewCollection: [UIView]!
    @IBOutlet var titleLabelCollection: [UILabel]!
    @IBOutlet var explainLabelCollection: [UILabel]!
    
    @IBOutlet weak var buttonBackgroundViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet var buttonWidthConstraintCollection: [NSLayoutConstraint]!
    
    // MARK: - VC Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setPickerView()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        initPickerView()
    }
    
    // MARK: - Functions
    
    private func setUI() {
        setViewUI()
        setLabelUI()
        setButtonUI()
    }
    
    private func setPickerView() {
        pickerView.delegate = self
        pickerView.dataSource = self
    }
    
    // MARK: - IBAction
    
    @IBAction func cancelButtonDidTap(_ sender: Any) {
    }
    
    @IBAction func saveButtonDidTap(_ sender: Any) {
    }
}

extension KmWeightViewController {
    private func setViewUI() {
        componentViewCollection.forEach { $0.layer.cornerRadius = 20 }
    }
    
    private func setLabelUI() {
        titleLabel.font = .SshFontH2
        timeLabel.font = .SshFontB1
        titleLabelCollection.forEach { $0.font = .NotoSans(.medium, size: 15) }
        explainLabelCollection.forEach { $0.font = .SshFontB3 }
    }
    
    private func setButtonUI() {
        buttonWidthConstraintCollection.forEach { $0.constant = UIScreen.main.bounds.width / 2 }
        [cancelButton, saveButton].forEach {
            $0?.titleLabel?.font = .SshFontB1
        }
    }
    
    private func initPickerView() {
        pickerView.subviews[1].backgroundColor = .clear
    }
}

extension KmWeightViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0: return 100
        case 1: return 3
        default: return 10
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0: return "\(row)"
        case 1: return "."
        default: return "\(row)"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        weight = Float(pickerView.selectedRow(inComponent: 0))
        weight += (Float(pickerView.selectedRow(inComponent: 2)) * 0.1)
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 20))
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 20))
        label.text = component == 1 ? "." : "\(row)"
        label.textAlignment = .center
        label.font = .SshFontH1
        view.addSubview(label)
        return view
    }
}
