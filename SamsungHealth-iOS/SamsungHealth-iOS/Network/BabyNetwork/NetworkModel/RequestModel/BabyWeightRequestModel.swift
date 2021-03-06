//
//  BabyWeightRequestModel.swift
//  SamsungHealth-iOS
//
//  Created by 이경민 on 2022/05/29.
//

import Foundation

struct BabyWeightRequestModel: Codable {
    let weight: Double
    let fatpercent: Double?
    let muscle: Double?
    let memo: String?
}
