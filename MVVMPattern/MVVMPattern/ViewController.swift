//
//  ViewController.swift
//  MVVMPattern
//
//  Created by jinseo park on 1/22/22.
//

import UIKit
import SnapKit
//import Alamofire

final class ViewController: UIViewController {
    /*
     Text 1개 -> 해당 화면에 나타날 값
        -년,월,일,시,분
     버튼 3개 -> 어제, 현재, 지금 버튼
     */
    private let netwokrHandler = NetworkHandler()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.text = "2022년 2월 22일 2시 22분"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var yesterdayBtn: UIButton = {
       let button = UIButton()
        button.setTitle("Yesterday", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitleColor(.systemGray, for: .highlighted)
        button.titleLabel?.font = .systemFont(ofSize: 15)
        button.addTarget(self, action: #selector(yesterDayBtnTouchedUpInside), for: .touchUpInside)
        return button
    }()
    
    private lazy var todayBtn: UIButton = {
       let button = UIButton()
        button.setTitle("Today", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitleColor(.systemGray, for: .highlighted)
        button.titleLabel?.font = .boldSystemFont(ofSize: 15)
        button.addTarget(self, action: #selector(todayBtnTouchedUpInside), for: .touchUpInside)
        return button
    }()
    
    private lazy var tomorrowBtn: UIButton = {
       let button = UIButton()
        button.setTitle("Tomorrow", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitleColor(.systemGray, for: .highlighted)
        button.titleLabel?.font = .systemFont(ofSize: 15)
        button.addTarget(self, action: #selector(tommorowBtnTouchedUpInside), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }

    private func configure() {
        self.view.backgroundColor = .white
        addDateLabel()
        addBtns()
    }

    private func addDateLabel() {
        view.addSubview(dateLabel)
        
        dateLabel.snp.makeConstraints { make -> Void in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-64)
        }
    }
    
    private func addBtns() {
        view.addSubview(todayBtn)
        todayBtn.snp.makeConstraints { make -> Void in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(16)
        }
        
        view.addSubview(yesterdayBtn)
        yesterdayBtn.snp.makeConstraints { make -> Void in
            make.trailing.equalTo(todayBtn.snp.leading).offset(-42)
            make.centerY.equalToSuperview().offset(16)
        }
                
        view.addSubview(tomorrowBtn)
        tomorrowBtn.snp.makeConstraints { make -> Void in
            make.leading.equalTo(todayBtn.snp.trailing).offset(42)
            make.centerY.equalToSuperview().offset(16)
        }
    }
    
    private func setDateText() {
        
    }
    
    @objc private func yesterDayBtnTouchedUpInside() {
        print("YesterDay")
    }
    
    @objc private func todayBtnTouchedUpInside() {
        print("Today")
        
        netwokrHandler.requestData{ (result: Result<DateDTO,Error>) in
            switch result {
            case .success(let success):
                print("원본 데이터",success)
                self.parsingDTO(dateDTO: success)
            case .failure(let failure):
                print("failure", failure)
            }
        }
    }
    
    @objc private func tommorowBtnTouchedUpInside() {
        print("Tommorow")
    }
    
    private func parsingDTO(dateDTO: DateDTO) -> Void {
        //TODO: 원본데이터에서 한국시간으로 바꿀 필요가 있다.
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ko_KR")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mmZ"
        let date = dateFormatter.date(from: dateDTO.currentDateTime)
        print("Korean date: \(date)")
    }
    
}

