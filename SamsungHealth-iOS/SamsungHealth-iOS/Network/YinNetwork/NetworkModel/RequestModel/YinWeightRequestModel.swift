//
//  YinWeightRequestModel.swift
//  SamsungHealth-iOS
//
//  Created by 이경민 on 2022/05/29.
//

import Foundation

struct YinWeightRequestModel: Codable {
    let weight: Double
    let fatPercent, muscle: Double?
    let memo: String?
}
