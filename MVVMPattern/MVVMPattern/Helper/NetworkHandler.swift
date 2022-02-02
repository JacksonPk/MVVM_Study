//
//  NetworkHandler.swift
//  MVVMPattern
//
//  Created by jinseo park on 1/29/22.
//

import Foundation
import Alamofire

final class NetworkHandler {
    private let URL = "http://worldclockapi.com/api/json/utc/now"
    
    func requestData<T>(completion: @escaping (Result<T,Error>) -> Void) where T: Decodable {
        let alamofire = AF.request(URL, method: .get).validate(statusCode: 200..<300)
        let dateDecoder = JSONDecoder()
        dateDecoder.dateDecodingStrategy = .iso8601

        alamofire.responseDecodable(of: T.self, decoder: dateDecoder) { response in
            switch response.result {
            case .success(let result):
                completion(.success(result))
            case .failure(let result) :
                print("Fail: error",result)
                completion(.failure(result))
            }
        }
    }
}
