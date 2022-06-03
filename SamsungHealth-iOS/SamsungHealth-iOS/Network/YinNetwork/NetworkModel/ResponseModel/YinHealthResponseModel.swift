//
//  YinHealthResponseModel.swift
//  SamsungHealth-iOS
//
//  Created by 이경민 on 2022/05/29.
//

import Foundation

struct YinHealthResponseModel: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: YinHealthData
}

struct YinHealthData: Codable {
    let step: YinStep
    let calorie: YinCalorie
    let sleep: YinSleep
    let weight: Double?
    let water: Int
}

struct YinCalorie: Codable {
    let intake, target: Int
}

struct YinSleep: Codable {
    let hour, minute: Int
    let time: String
}

struct YinStep: Codable {
    let count, target, time, activity: Int
    let percent: Int
}
