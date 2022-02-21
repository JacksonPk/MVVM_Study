//
//  ViewModel.swift
//  MVVMPattern
//
//  Created by jinseo park on 2022/02/22.
//

import Foundation
import RxRelay

class ViewModel {
    
    let dateTimeString = BehaviorRelay(value: "xxxx년 xx월 xx일")
//    var dateTimeString: String = "xxxx년 xx월 xx일"
//    {
//        didSet {
//            onUpdatedCallBack() //내가
//        }
//    }    
//    var onUpdatedCallBack: () -> Void = {}
    let service = Service()
    
    func dateLoad() {
        service.fetchNow { [weak self] model in
            guard let self = self else {return}
            let dateString = self.updateDataTime(date: model.currentDateTime)
//            self.dateTimeString = dateString
            self.dateTimeString.accept(dateString)
        }
    }
    func updateDataTime(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy MM dd"
        return formatter.string(from: date)
    }
    
    func moveDay(day: Int) {
        service.moveDay(day: day)
        //self.dateTimeString = updateDataTime(date: service.currModel.currentDateTime)
        self.dateTimeString.accept(updateDataTime(date: service.currModel.currentDateTime))
    }
}
