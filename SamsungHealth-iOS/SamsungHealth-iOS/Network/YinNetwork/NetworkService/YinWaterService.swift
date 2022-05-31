//
//  YinWaterService.swift
//  SamsungHealth-iOS
//
//  Created by 이경민 on 2022/05/29.
//

import Alamofire

class YinWaterService {
    static let shared = YinWaterService()
    
    private init() {}
    
    func healthWater(waterData: YinWaterRequestModel,
                      completion: @escaping (NetworkResult<Any>) -> Void)
    {
        let url = URLConstant.healthWater
        let header: HTTPHeaders = ["Content-Type" : "application/json"]
        
        let body: Parameters = [
            "type": waterData.type
        ]
        
        let dataRequest = AF.request(url,
                                     method: .put,
                                     parameters: body,
                                     encoding: JSONEncoding.default,
                                     headers: header)
        
        dataRequest.responseData { response in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else { return }
                guard let value = response.value else { return }
                let networkResult = self.judgeStatus(by: statusCode, value)
                completion(networkResult)
            case .failure:
                completion(.networkFail)
            }
        }
    }
    
    func judgeStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(YinWaterResponseModel.self, from: data)
        else { return .pathErr }
        
        switch statusCode {
        case 200 ..< 300: return .success(decodedData)
        case 401 ..< 500: return .requestErr(decodedData)
        case 500: return .serverErr
        default: return .networkFail
        }
    }
}
