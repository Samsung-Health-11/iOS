//
//  BaseTargetType.swift
//  SamsungHealth-iOS
//
//  Created by 이경민 on 2022/05/15.
//

import Moya

protocol BaseTargetType: TargetType { }

extension BaseTargetType {

    var baseURL: URL {
        return URL(string: URLConstant.baseURL)!
    }
    
    var sampleData: Data {
        return Data()
    }
}
