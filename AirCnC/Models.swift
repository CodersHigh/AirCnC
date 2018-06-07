//
//  Models.swift
//  AirCnC
//
//  Created by wannabewize on 2018. 6. 8..
//  Copyright © 2018년 Jaehoon Lee. All rights reserved.
//

import Foundation

// 튜플로 크기 정보 다루기
typealias Size = (w:Int, d:Int, h:Int)

// 구조체로 만들기
struct Item {
    var name: String
    var thumbnail: String // 썸네일 이미지
    var detailImage: [String]? // 상세 이미지는 없을 수도 있다.
    var price: Int
    var size: Size? // 크기 정보는 없을 수도 있다.
    var user: User
}

// 클래스로 만들기
class User {
    var name: String
    var image: String?
    // 생성자
    init(name: String, image: String?) {
        self.name = name
        self.image = image
    }
    
    // 미리 생성한 유저 정보
    static let ggamdi = User(name: "깜디", image:"ggamdi")
    static let franky = User(name: "프랭키", image:"franky")
    static let goyangci = User(name: "고양씨", image:"goyangc")
    static let popo = User(name: "뽀뽀", image:"popo")
}
