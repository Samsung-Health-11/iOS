//
//  BabyHomeViewController.swift
//  SamsungHealth-iOS
//
//  Created by 이경민 on 2022/05/14.
//

import UIKit

class BabyHomeViewController: UIViewController {

    // MARK: - VC Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - @IBAction
    @IBAction func weightbtnDidTap(_ sender: Any) {
        guard let babyWeightVC = UIStoryboard(name: "BabyWeight", bundle: nil).instantiateViewController(withIdentifier: "BabyWeightViewController") as? BabyWeightViewController else { return }

        babyWeightVC.modalTransitionStyle = .crossDissolve
        babyWeightVC.modalPresentationStyle = .fullScreen

        self.present(babyWeightVC, animated: true, completion: nil)
    }
}
