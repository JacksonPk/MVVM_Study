//
//  ViewController.swift
//  MVVMPattern
//
//  Created by jinseo park on 1/22/22.
//

import UIKit
import SnapKit

final class ViewController: UIViewController {
    
    private let vm = ViewModel()
    
    var currDate = Date()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.text = "xxxx년 x월 xx일"
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

        vm.onUpdatedCallBack = { [weak self] in
            guard let self = self else {return}
            self.dateLabel.text = self.vm.dateTimeString
        }
        vm.dateLoad()
        
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
    
    @objc private func yesterDayBtnTouchedUpInside() {
        print("YesterDay")
        vm.moveDay(day: -1)
    }
    
    @objc private func todayBtnTouchedUpInside() {
        print("Today")
        vm.dateLoad()
    }
    
    @objc private func tommorowBtnTouchedUpInside() {
        print("Tommorow")
        vm.moveDay(day: 1)
    }
    
}

