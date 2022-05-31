//
//  BabyHealthService.swift
//  SamsungHealth-iOS
//
//  Created by 이경민 on 2022/05/29.
//

import Foundation
import Alamofire

struct BabyHealthService {
    static let shared = BabyHealthService()
    private init() {}
    
    func loadHealthData(completion: @escaping (NetworkResult<Any>) -> (Void))
    {
        let url = URLConstant.health
        let header: HTTPHeaders = ["Content-Type" : "application/json"]
        let dataRequest = AF.request(url,
                                     method: .get,
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
        case 200: return isValidHealthURL(data: data)
        case 500: return .serverErr
        default: return .networkFail
        }
    }
    
    private func isValidHealthURL(data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(BabyHealthResponseModel.self, from: data)
        else { return .pathErr }
        
        return .success(decodedData.data as Any)
    }
}
