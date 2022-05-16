//
//  BabyMainTabBarController.swift
//  SamsungHealth-iOS
//
//  Created by 이경민 on 2022/05/16.
//

import UIKit

class BabyMainTabBarController: UITabBarController {

    // MARK: - VC Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBarController()
    }
    
    // MARK: - Function
    func setTabBarController(){
        tabBar.unselectedItemTintColor = UIColor(displayP3Red: 155/255, green: 155/255, blue: 155/255, alpha: 1)
        tabBar.tintColor = UIColor(displayP3Red: 155/255, green: 155/255, blue: 155/255, alpha: 1)
    }

}
