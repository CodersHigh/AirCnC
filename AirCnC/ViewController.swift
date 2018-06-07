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
    
    // 상세 정보
    var item: Item?
    
    // 이미지 갤러리
    var currentImageIndex = 0
    var images: [String] = []
    
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
        if let item = self.item {
            // 좋아요 목록에서 제거/좋아요 목록에 추가
            if Liked.shared.isLiked(item) {
                Liked.shared.remove(item)
                likeButton.isSelected = false
            }
            else {
                Liked.shared.add(item)
                likeButton.isSelected = true
            }
        }
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
        
        // 이미지 뷰 하단 구분선 그리기
        let borderLayer = CALayer()
        borderLayer.backgroundColor = UIColor.lightGray.cgColor
        borderLayer.frame = CGRect(x: 0, y: self.imageView.frame.height - 0.5, width: self.imageView.frame.width, height: 0.5)
        self.imageView.layer.addSublayer(borderLayer)

        // 사용자 프로필 이미지를 둥글게
        userImageView.clipsToBounds = true
        userImageView.layer.cornerRadius = userImageView.frame.width / 2
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // 옵셔널
        if let item = item {
            titleLabel.text = item.name
            userNameLabel.text = item.user.name
            if let imageName = item.user.image {
                userImageView.image = UIImage(named: imageName)
            }
            priceLabel.text = String(item.price)
            
            if let size = item.size {
                depthLabel.text = "\(size.d)cm"
                widthLabel.text = "\(size.w)cm"
                heightLabel.text = "\(size.h)cm"
            }
            
            images = item.detailImage ?? []
            showImage(index: 0)
            
            self.title = item.name
            
            // 좋아요가 눌러졌는지 좋아요 버튼에 반영
            likeButton.isSelected = Liked.shared.isLiked(item)
        }       
        
        // 날짜 레이블 설정
        handleDateChanged()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

