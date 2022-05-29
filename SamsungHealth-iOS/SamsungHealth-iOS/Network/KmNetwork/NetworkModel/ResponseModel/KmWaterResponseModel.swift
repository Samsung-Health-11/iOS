//
//  KmWaterResponseModel.swift
//  SamsungHealth-iOS
//
//  Created by 이경민 on 2022/05/29.
//

import Foundation

// MARK: - KmWaterResponse
struct KmWaterResponse: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: KmWaterResponseData?
}

// MARK: - DataClass
struct KmWaterResponseData: Codable {
    let water: Int
}
