//
//  BabyHomeViewController+Network.swift
//  SamsungHealth-iOS
//
//  Created by 이경민 on 2022/05/14.
//

import Foundation

extension BabyHomeViewController {

    func loadHealthData() {
        BabyHealthService.shared.loadHealthData() {
            response in
            switch response {
            case .success(let data):
                guard let data = data as? BabyHealthDataClass else { return }
                self.stepCountLabel.text = "\(data.step.count)"
                self.stepTargetLabel.text = "/\(data.step.target)"
                self.stepPercentLabel.text = "\(data.step.percent)%"
                self.stepCount_1Label.text = "\(data.step.count)"
                self.stepTimeLabel.text = "\(data.step.time)"
                self.stepActivityLabel.text = "\(data.step.activity)"
                self.calorieIntakeLabel.text = "\(data.calorie.intake)"
                self.calorieTargetLabel.text = "/\(data.calorie.target)kcal"
                self.sleepHourLabel.text = "\(data.sleep.hour)"
                self.sleepMinuteLabel.text = "\(data.sleep.minute)"
                self.sleepTimeLabel.text = data.sleep.time
                self.weightLabel.text = "\(data.weight)"
                self.waterLabel.text = "\(data.water)"
                print(data)
            default:
                print(response)
            }
        }
    }
}

