//
//  Service.swift
//  MVVMPattern
//
//  Created by jinseo park on 2022/02/22.
//

import Foundation

class Service {
    let networkHandler = NetworkHandler()
    var currModel = DateModel(currentDateTime: Date())
    
    func fetchNow(onCompleted: @escaping (DateModel) -> Void) {
        
        networkHandler.requestData{ (result: Result<ServerDateDTO,Error>) in
            switch result {
            case .success(let dateDTO):
                let dateFormatter = DateFormatter()
                dateFormatter.locale = Locale(identifier: "ko_KR")
                dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mmZ"
                guard let date = dateFormatter.date(from: dateDTO.currentDateTime) else {return}
                let model = DateModel(currentDateTime: date)
                self.currModel = model
                onCompleted(model)

            case .failure(let failure):
                print("failure", failure)
            }
        }
    }
    
    func moveDay(day: Int) {
        guard let moveDay = Calendar.current.date(byAdding: .day, value: day, to: currModel.currentDateTime) else {return}
        currModel.currentDateTime = moveDay
    }
}
