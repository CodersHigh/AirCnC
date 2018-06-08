//
//  ReservationViewController.swift
//  AirCnC
//
//  Created by wannabewize on 2018. 6. 8..
//  Copyright © 2018년 Jaehoon Lee. All rights reserved.
//

import UIKit

class DateSelectViewController: UIViewController {

    @IBOutlet weak var startDatePicker: UIDatePicker!
    @IBOutlet weak var endDatePIcker: UIDatePicker!
    @IBOutlet weak var doneButton: UIBarButtonItem!
    
    // 두 데이트피커의 valueChanged 이벤트 연결
    @IBAction func handleDateChange() {
        // 시작일이 종료일보다 앞서는 것을 막음
        doneButton.isEnabled = endDatePIcker.date >= startDatePicker.date
    }
    
    @IBAction func handleCancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destVC = segue.destination as? ViewController {
            destVC.reserveStartDate = startDatePicker.date
            destVC.reserveEndDate = endDatePIcker.date
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
