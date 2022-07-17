//
//  ViewController.swift
//  Timer_Stopwatch
//
//  Created by kakao on 2022/07/14.
//

import UIKit

class TimerViewController: UIViewController {
    let hoursArr = Array<Int>(0...99)
    let minutesSecondsArr = Array<Int>(0...59)
    var timeValue: [Int] = [0,0,0]
    
    let timePickerView: UIPickerView = {
        var timePickerView = UIPickerView()
        timePickerView.translatesAutoresizingMaskIntoConstraints = false
        return timePickerView
    }()
    
    let hLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "시간"
        label.textAlignment = .center
        label.baselineAdjustment = .alignCenters
        return label
    }()
    
    let mLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "분"
        label.textAlignment = .center
        label.baselineAdjustment = .alignCenters
        return label
    }()
    
    let sLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "초"
        label.textAlignment = .center
        label.baselineAdjustment = .alignCenters
        return label
    }()
    
    let startBtn: UIButton = {
        var btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .blue
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.setTitle("시작", for: .normal)
        return btn
    }()
    
    @objc func start() {
        let stVC = StartTimerViewController()
        stVC.modalTransitionStyle = .coverVertical
        self.present(stVC, animated: true)
        //StartTimerVC완성 후 데이터 전달 코드 필요
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startBtn.addTarget(self, action: #selector(start), for: .touchUpInside)
        
        self.timePickerView.delegate = self
        self.timePickerView.dataSource = self
        
        let safeArea = self.view.safeAreaLayoutGuide
        
        self.view.addSubview(timePickerView)
        self.view.addSubview(hLabel)
        self.view.addSubview(mLabel)
        self.view.addSubview(sLabel)
        self.view.addSubview(startBtn)
        
        NSLayoutConstraint.activate([
            self.timePickerView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            self.timePickerView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            self.timePickerView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 50.0),
            self.timePickerView.heightAnchor.constraint(equalToConstant: self.view.frame.height / 2)
        ])
        
        NSLayoutConstraint.activate([
            self.hLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 70.0),
            self.hLabel.heightAnchor.constraint(equalToConstant: 20.0),
            self.hLabel.widthAnchor.constraint(equalToConstant: view.frame.width / 3.5),
            self.hLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            self.mLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 70.0),
            self.mLabel.heightAnchor.constraint(equalToConstant: 20.0),
            self.mLabel.widthAnchor.constraint(equalToConstant: view.frame.width / 3.5),
            self.mLabel.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            self.sLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 70.0),
            self.sLabel.heightAnchor.constraint(equalToConstant: 20.0),
            self.sLabel.widthAnchor.constraint(equalToConstant: view.frame.width / 3.5),
            self.sLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            self.startBtn.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            self.startBtn.heightAnchor.constraint(equalToConstant: 40),
            self.startBtn.widthAnchor.constraint(equalToConstant: 100),
            self.startBtn.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -(view.frame.height / 4))
        ])
    }
}

extension TimerViewController : UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return CGFloat(80.0)
    }
}

extension TimerViewController : UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return hoursArr.count
        }else {
            return minutesSecondsArr.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return String(format: "%02d", hoursArr[row])
        }else {
            return String(format: "%02d", minutesSecondsArr[row])
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            timeValue[0] = hoursArr[row]
        }else if component == 1 {
            timeValue[1] = minutesSecondsArr[row]
        }else {
            timeValue[2] = minutesSecondsArr[row]
        }
        
    }
    
}
