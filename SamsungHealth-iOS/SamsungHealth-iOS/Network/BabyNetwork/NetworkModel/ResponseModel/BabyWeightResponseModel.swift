//
//  BabyWeightResponseModel.swift
//  SamsungHealth-iOS
//
//  Created by 이경민 on 2022/05/29.
//

import Foundation

struct BabyWeightResponseModel: Codable {
    let status: Int
    let success: Bool
    let message: String
}
