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
        if let delegate = delegate,
            let cancelFn = delegate.reserveDateSelectCancelled {
            cancelFn()
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func handleDone(_ sender: Any) {
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
