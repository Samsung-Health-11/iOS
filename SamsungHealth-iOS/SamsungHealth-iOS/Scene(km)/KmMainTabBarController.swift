//
//  KmMainTabBarController.swift
//  SamsungHealth-iOS
//
//  Created by 이경민 on 2022/05/16.
//

import UIKit

final class KmMainTabBarController: UITabBarController {

    // MARK: - VC Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    // MARK: - Functions
    
    private func setUI() {
        tabBar.tintColor = .SshColorGray3
        tabBar.unselectedItemTintColor = .SshColorGray3
    }
}
