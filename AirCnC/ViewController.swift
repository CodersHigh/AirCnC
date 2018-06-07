//
//  ViewController.swift
//  AirCnC
//
//  Created by Jaehoon Lee on 2018. 6. 7..
//  Copyright © 2018년 Jaehoon Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var depthLabel: UILabel!
    @IBOutlet weak var widthLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var dateLabel: UILabel!
    
    // 이미지 갤러리
    var currentImageIndex = 0
    let images = [
        "hattefjall_1",
        "hattefjall_2",
        "hattefjall_3",
        "hattefjall_4",
        "hattefjall_5"
    ]
    
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    
    @IBAction func showPrevImage(_ sender: Any) {
        currentImageIndex -= 1
        self.showImage(index: currentImageIndex)
    }
    
    @IBAction func showNextImage(_ sender: Any) {
        currentImageIndex += 1
        self.showImage(index: currentImageIndex)
    }
    
    func showImage(index: Int) {
        let imageName = images[index]
        imageView.image = UIImage(named: imageName)
        
        // 좌/우 이미지 이동이 불가능한 상태면 버튼 상태를 disabled로
        leftButton.isEnabled = index > 0
        rightButton.isEnabled = index < images.count - 1
    }
    
    // 좋아요/저장 버튼 토글방식으로 동작. touchUpInside와 연결
    @IBAction func handleLike(_ sender: Any) {
        likeButton.isSelected = !likeButton.isSelected
    }
    
    // 날짜 선택
    let dateFormatter = DateFormatter()
    @IBOutlet weak var datePicker: UIDatePicker!
    // valueChanged 이벤트와 연결
    @IBAction func handleDateChanged() {
        let dateStr = dateFormatter.string(from: datePicker.date)
        dateLabel.text = dateStr
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // 초기 이미지는 첫번째 이미지이므로 왼쪽 버튼은 disabled로
        leftButton.isEnabled = false
        dateFormatter.dateStyle = .medium
    }
    
    override func viewWillAppear(_ animated: Bool) {
        imageView.image = UIImage.init(named: "hattefjall")
        
        titleLabel.text = "HATTEFJÄLL"
        
        userImageView.image = #imageLiteral(resourceName: "franky")
        userNameLabel.text = "프랭키"
        
        priceLabel.text = "10,000"
        depthLabel.text = "68cm"
        widthLabel.text = "68cm"
        heightLabel.text = "110cm"
        
        // 날짜 레이블 설정
        handleDateChanged()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

