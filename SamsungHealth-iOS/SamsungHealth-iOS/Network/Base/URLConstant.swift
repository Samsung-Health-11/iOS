//
//  URLConstant.swift
//  SamsungHealth-iOS
//
//  Created by 이경민 on 2022/05/15.
//

import Foundation

struct URLConstant {
    
    // MARK: - base URL
    
    static let baseURL = "http://15.165.213.118:8000"
    
    // MARK: - Health
    
    static let health = baseURL + "/health"
    static let healthWeight = baseURL + "/health/weight"
    static let healthWater = baseURL + "/health/water"
}
