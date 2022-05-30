//
//  YinWeightViewController+Network.swift
//  SamsungHealth-iOS
//
//  Created by 이경민 on 2022/05/14.
//

extension YinWeightViewController {
    func postWeight(_ weightInput: YinWeightRequestModel) {
        YinWeightService.shared.healthWeight(weightData: weightInput) { response in
            switch response {
            case .success(let data):
                guard let data = data as? YinWeightResponseModel else { return }
                self.dismiss(animated: true)
                print(data)
            default:
                print(response)
            }
        }
    }
}
