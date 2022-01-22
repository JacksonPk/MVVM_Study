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
        label.textAlignment = .center
        return label
    }()
    private lazy var monthLabel: UILabel = {
        let label = UILabel()
        label.text = "월"
        label.textAlignment = .center
        return label
    }()
    private lazy var dayLabel: UILabel = {
        let label = UILabel()
        label.text = "일"
        label.textAlignment = .center
        return label
    }()
    private lazy var hourLabel: UILabel = {
        let label = UILabel()
        label.text = "시"
        label.textAlignment = .center
        return label
    }()
    private lazy var minLabel: UILabel = {
        let label = UILabel()
        label.text = "분"
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }

    private func configure() {
        self.view.backgroundColor = .yellow
        initTextView()
    }

    private func initTextView() {
        view.addSubview(yearLabel)
        view.addSubview(monthLabel)
//        view.addSubview(dayLabel)
//        view.addSubview(hourLabel)
//        view.addSubview(dayLabel)
        
        yearLabel.snp.makeConstraints { label -> Void in
            label.centerY.equalToSuperview()
//            label.width.height.equalTo(50)
            label.left.equalToSuperview().offset(80)
        }
        
        monthLabel.snp.makeConstraints { label -> Void in
            label.centerY.equalToSuperview()
            label.left.equalTo(yearLabel.snp_rightMargin).offset(16)
        }
//
//        monthLabel.snp.makeConstraints { label -> Void in
//            label.centerY.equalToSuperview()
//            label.left.equalTo(yearLabel.snp_rightMargin).offset(16)
//        }
//
//        monthLabel.snp.makeConstraints { label -> Void in
//            label.centerY.equalToSuperview()
//            label.left.equalTo(yearLabel.snp_rightMargin).offset(16)
//        }
    }
}

