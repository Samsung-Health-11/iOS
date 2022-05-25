//
//  KmHomeViewController.swift
//  SamsungHealth-iOS
//
//  Created by 이경민 on 2022/05/14.
//

import UIKit

final class KmHomeViewController: UIViewController {
    
    // MARK: - IBOutlet
    
    @IBOutlet var componentViewCollection: [UIView]!
    @IBOutlet var titleLabelCollection: [UILabel]!
    
    // MARK: - VC Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    // MARK: - Function
    
    private func setUI() {
        setViewUI()
        setLabelUI()
    }
    
    // MARK: - IBAction
    @IBAction func writeWeightButtonDidTap(_ sender: Any) {
        guard let weightVC = UIStoryboard(name: Const.Storyboard.KmWeight, bundle: nil).instantiateViewController(withIdentifier: Const.ViewController.KmWeightViewController) as? KmWeightViewController else { return }
        present(weightVC, animated: true)
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
