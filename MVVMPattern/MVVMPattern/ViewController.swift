//
//  ViewController.swift
//  MVVMPattern
//
//  Created by jinseo park on 1/22/22.
//

import UIKit
import SnapKit
import Alamofire


class ViewController: UIViewController {
    /*
     Text 1개 -> 해당 화면에 나타날 값
        -년,월,일,시,분
     버튼 3개 -> 어제, 현재, 지금 버튼
     */
    private lazy var yearLabel: UILabel = {
        let label = UILabel()
        label.text = "년"
        label.font.withSize(10)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var monthLabel: UILabel = {
        let label = UILabel()
        label.text = "월"
        label.font.withSize(10)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var dayLabel: UILabel = {
        let label = UILabel()
        label.text = "일"
        label.font.withSize(10)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var hourLabel: UILabel = {
        let label = UILabel()
        label.text = "시"
        label.font.withSize(10)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var minLabel: UILabel = {
        let label = UILabel()
        label.text = "분"
        label.font.withSize(10)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.text = "안녕하세요 잭슨입니당!! "
//        label.tintColor = UIColorl
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }

    private func configure() {
        self.view.backgroundColor = .white
//        initTextView()
        addDateLabel()
    }

    private func addDateLabel() {
        view.addSubview(dateLabel)
        
        dateLabel.snp.makeConstraints { make -> Void in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-16)
        }
    }

    private func initTextView() {
        view.addSubview(yearLabel)
        view.addSubview(monthLabel)
        view.addSubview(dayLabel)
        view.addSubview(hourLabel)
        view.addSubview(minLabel)
        
        yearLabel.snp.makeConstraints { label -> Void in
            label.centerY.equalToSuperview()
            label.leading.equalToSuperview().offset(100)
        }
        
        monthLabel.snp.makeConstraints { label -> Void in
            label.centerY.equalToSuperview()
            label.leading.equalTo(yearLabel.snp.trailing).offset(16)
        }
        
        dayLabel.snp.makeConstraints { label -> Void in
            label.centerY.equalToSuperview()
            label.leading.equalTo(monthLabel.snp.trailing).offset(16)
        }
        
        hourLabel.snp.makeConstraints { label -> Void in
            label.centerY.equalToSuperview()
            label.leading.equalTo(dayLabel.snp.trailing).offset(16)
        }
        
        minLabel.snp.makeConstraints { label -> Void in
            label.centerY.equalToSuperview()
            label.leading.equalTo(hourLabel.snp.trailing).offset(16)
        }
        
    }
}

