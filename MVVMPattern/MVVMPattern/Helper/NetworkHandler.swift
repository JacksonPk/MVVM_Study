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
    
    func requestData() {
        let alamofire = AF.request(URL, method: .get).validate(statusCode: 200..<300)
        alamofire.responseString() { response in
            switch response.result {
            case .success(let result):
                print("Success:",result)
            case .failure(let result) :
                print("Fail:",result)
            }
        }
    }
}
