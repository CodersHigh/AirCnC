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
    var id: String
    var name: String
    var thumbnail: String // 썸네일 이미지
    var detailImage: [String]? // 상세 이미지는 없을 수도 있다.
    var price: Int
    var size: Size? // 크기 정보는 없을 수도 있다.
    var user: User
}

// 미리 작성해놓은 예약 상품들
struct ReserveItem {
    static let items = [
        Item(id: "item001", name: "ÄLEBY", thumbnail: "aleby",
             detailImage: ["aleby_1", "aleby_2", "aleby_3", "aleby_4", "aleby_5", "aleby_6", "aleby_7"],
             price: 34000, size: Size(w: 86, d: 88, h: 101),
             user: User.ggamdi),
        Item(id: "item002", name: "BROMMÖ", thumbnail: "brommo",
             detailImage: ["brommo_1", "brommo_2", "brommo_3", "brommo_4", "abrommo_5"],
             price: 8000, size: Size(w: 48, d: 92, h: 89),
             user: User.franky),
        Item(id: "item003", name: "EKEDALEN", thumbnail: "ekedalen",
             detailImage: ["ekedalen_1", "ekedalen_2", "ekedalen_3", "ekedalen_4", "ekedalen_5"],
             price: 6000, size: Size(w: 43, d: 51, h: 95),
             user: User.goyangci),
        Item(id: "item004", name: "HATTEFJÄLL", thumbnail: "hattefjall",
             detailImage: ["hattefjall_1", "hattefjall_2", "hattefjall_3", "hattefjall_4", "hattefjall_5"],
             price: 23000, size: Size(w: 68, d: 68, h: 110),
             user: User.franky),
        Item(id: "item005", name: "MARKUS", thumbnail: "markus",
             detailImage: ["markus_1", "markus_2", "markus_3", "markus_4", "markus_5", "markus_6", "markus_7"],
             price: 20000, size: Size(w: 62, d: 60, h: 140),
             user: User.popo),
        Item(id: "item006", name: "MILLBERGET", thumbnail: "millberget",
             detailImage: ["millberget_1", "millberget_2", "millberget_3", "millberget_4", "millberget_5", "millberget_6"],
             price: 8000, size: Size(w: 52, d: 65, h: 123),
             user: User.goyangci),
        Item(id: "item007", name: "NORDMYRA", thumbnail: "nordmyra",
             detailImage: ["nordmyra_1", "nordmyra_2", "nordmyra_3"],
             price: 5000, size: Size(w: 45, d: 48, h: 80),
             user: User.popo),
        Item(id: "item008", name: "NORRÅKER", thumbnail: "norraker",
             detailImage: ["norraker_1", "norraker_2", "norraker_3", "norraker_4", "norraker_5", "norraker_6"],
             price: 8000, size: Size(w: 41, d: 50, h: 81),
             user: User.ggamdi),
        Item(id: "item009", name: "TUNHOLMEN", thumbnail: "tunholmen",
             detailImage: ["tunholmen_1", "tunholmen_2", "tunholmen_3", "tunholmen_4", "tunholmen_5"],
             price: 8000, size: Size(w: 55, d: 55, h: 78),
             user: User.ggamdi),
        Item(id: "item010", name: "YPPERLIG", thumbnail: "ypperlig",
             detailImage: ["ypperlig_1", "ypperlig_2", "ypperlig_3", "ypperlig_4", "ypperlig_5", "ypperlig_6", "ypperlig_7"],
             price: 8000, size: Size(w: 55, d: 51, h: 83),
             user: User.popo)
    ]
    static func item(with id: String) -> Item? {
        for item in items {
            if item.id == id {
                return item
            }
        }
        return nil
    }
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

struct Liked {
    // Singleton
    static var shared = Liked()
    
    var saves : [Item] = []
    
    func isLiked(_ item: Item) -> Bool {
        for one in saves {
            // 제품 이름으로 같다고 비교한다. TODO : equal operator 작성
            if one.name == item.name {
                return true
            }
        }
        return false
    }
    
    mutating func add(_ item: Item) {
        self.saves.append(item)
    }
    
    mutating func remove(_ item: Item) {
        for (index, one) in saves.enumerated() {
            // 제품 이름으로 같다고 비교한다. TODO : equal operator 작성
            if one.name == item.name {
                saves.remove(at: index)
                return
            }
        }
    }
}

struct ReserveInfo: Codable {
    var itemId: String
    var startDate: Date
    var endDate: Date
}

struct Reservation {
    static var shared = Reservation()
    var reserves: [ReserveInfo] = []
    mutating func addReserve(item: Item, from: Date, to: Date) {
        let reserve = ReserveInfo(itemId: item.id, startDate: from, endDate: to)
        reserves.append(reserve)
    }
}

