//
//  ReservationViewController.swift
//  AirCnC
//
//  Created by wannabewize on 2018. 6. 8..
//  Copyright © 2018년 Jaehoon Lee. All rights reserved.
//

import UIKit

@objc protocol ReserveDateSelectDelegate: class {
    @objc optional func reserveDateSelectCancelled()
    func reserveDateDidSelected(from: Date, to: Date)
}

class DateSelectViewController: UIViewController {

    @IBOutlet weak var startDatePicker: UIDatePicker!
    @IBOutlet weak var endDatePIcker: UIDatePicker!
    
    weak var delegate: ReserveDateSelectDelegate?
    
    @IBAction func handleCancel(_ sender: Any) {
        // 델리게이트 존재 확인, 옵셔널 함수 존재 확인
        if let delegate = delegate,
            let cancelFn = delegate.reserveDateSelectCancelled {
            cancelFn()
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func handleDone(_ sender: Any) {
        // 델리게이트가 존재하면 사용자가 선택한 값을 전달
        if let delegate = delegate {
            delegate.reserveDateDidSelected(from: startDatePicker.date, to: endDatePIcker.date)
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
