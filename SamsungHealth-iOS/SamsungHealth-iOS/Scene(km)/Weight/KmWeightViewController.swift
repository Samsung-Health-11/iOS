//
//  KmWeightViewController.swift
//  SamsungHealth-iOS
//
//  Created by 이경민 on 2022/05/14.
//

import UIKit

final class KmWeightViewController: UIViewController {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    
    @IBOutlet var componentViewCollection: [UIView]!
    @IBOutlet var titleLabelCollection: [UILabel]!
    @IBOutlet var explainLabelCollection: [UILabel]!
    
    @IBOutlet weak var buttonBackgroundViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet var buttonWidthConstraintCollection: [NSLayoutConstraint]!
    
    // MARK: - VC Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    // MARK: - Functions
    
    private func setUI() {
        setViewUI()
        setLabelUI()
        setButtonUI()
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
}
