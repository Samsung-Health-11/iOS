//
//  BabyWeightViewController+Network.swift
//  SamsungHealth-iOS
//
//  Created by 이경민 on 2022/05/14.
//

import Foundation

extension BabyWeightViewController {

    func recordWeight() {
        guard let fatPercent = fatPercentTextField.text else { return }
        guard let muscle = muscleTextField.text else { return }
        guard let memo = memoTextField.text else { return }
        
        BabyWeightService.shared.recordWeightData(weight: weightData,
                                                  fatpercent: Double(fatPercent),
                                                  muscle: Double(muscle),
                                                  memo: memo) {
            response in
            switch response {
            case .success(let data):
                guard let data = data as? BabyWeightResponseModel else { return }
                self.dismiss(animated: true, completion: nil)
                print(data)
            case .pathErr:
                print("필요한 값이 없습니다. ")
            default:
                print(response)
            }
        }
    }
}
    
