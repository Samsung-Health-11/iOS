//
//  KmHealthResponseModel.swift
//  SamsungHealth-iOS
//
//  Created by 이경민 on 2022/05/29.
//

import Foundation

// MARK: - KmHealthResponse
struct KmHealthResponse: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: KmHealthResponseData?
}

// MARK: - KmHealthResponseData
struct KmHealthResponseData: Codable {
    let step: Step
    let calorie: Calorie
    let sleep: Sleep
    let weight: Double
    let water: Int
}

// MARK: - Calorie
struct Calorie: Codable {
    let intake, target: Int
}

// MARK: - Sleep
struct Sleep: Codable {
    let hour, minute: Int
    let time: String
}

// MARK: - Step
struct Step: Codable {
    let count, target, time, activity: Int
    let percent: Int
}
