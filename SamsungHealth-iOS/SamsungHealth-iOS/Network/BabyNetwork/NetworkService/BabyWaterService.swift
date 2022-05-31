//
//  BabyWaterService.swift
//  SamsungHealth-iOS
//
//  Created by 이경민 on 2022/05/29.
//

import Foundation
import Alamofire

struct BabyWaterService {
    static let shared = BabyWaterService()
    private init() {}
    
    func modifyWaterData(dataModel : BabyWaterRequestModel,
                          completion: @escaping (NetworkResult<Any>) -> (Void))
    {
        let url = URLConstant.healthWater
        let header: HTTPHeaders = ["Content-Type" : "application/json"]
        let body: Parameters = [
            "type": dataModel.type
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
    
    private func judgeStatus (by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        print(statusCode)
        switch statusCode {
        case 200: return isValidWaterURL(data: data)
        case 400: return .pathErr
        case 500: return .serverErr
        default: return .networkFail
        }
    }
    
    private func isValidWaterURL(data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(BabyWaterResponseModel.self, from: data)
        else { return .pathErr }
        
        return .success(decodedData as Any)
    }
}
