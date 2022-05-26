//
//  YinHomeViewController.swift
//  SamsungHealth-iOS
//
//  Created by 이경민 on 2022/05/14.
//

import UIKit

class YinHomeViewController: UIViewController {
    
    // MARK: - IBOutlet
    
    @IBOutlet var titleLabels: [UILabel]!
    @IBOutlet var h1Labels: [UILabel]!
    @IBOutlet var b2Labels: [UILabel]!
    @IBOutlet var c1Labels: [UILabel]!
    
    // MARK: - VC Life Cycle (or Cell Life Cycle)
    
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

    // MARK: - IBAction
    @IBAction func weightBtnDidTap(_ sender: Any) {
        guard let weightVC = UIStoryboard(name: "YinWeight", bundle: nil).instantiateViewController(withIdentifier: "YinWeightViewController") as? YinWeightViewController else { return }
        weightVC.modalPresentationStyle = .fullScreen
        present(weightVC, animated: true)
    }
    
}
