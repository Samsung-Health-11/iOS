//
//  YinHomeViewController+Network.swift
//  SamsungHealth-iOS
//
//  Created by 이경민 on 2022/05/14.
//

import UIKit

extension YinHomeViewController {
    
    func getHealth() {
        YinHealthService.shared.health() { response in
            switch response {
            case .success(let data):
                guard let data = data as? YinHealthData else { return }
                self.setData(data)
                self.setWaterBtn(data.water)
                print(data)
            default:
                print(response)
            }
        }
    }
    
    func putWater(_ waterInput: YinWaterRequestModel) {
        YinWaterService.shared.healthWater(waterData: waterInput) { response in
            switch response {
            case .success(let data):
                guard let data = data as? YinWaterResponseModel else { return }
                self.getHealth()
                print(data)
            default:
                print(response)
            }
        }
    }
    
}
