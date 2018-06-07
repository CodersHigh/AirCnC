//
//  ExplorerViewController.swift
//  AirCnC
//
//  Created by Jaehoon Lee on 2018. 6. 8..
//  Copyright © 2018년 Jaehoon Lee. All rights reserved.
//

import UIKit

struct ItemInfo {
    var userName: String
    var itemName: String
    var itemImage: String
}

class ExplorerViewController: UITableViewController {
    
    var items = [
        ItemInfo(userName: "깜디", itemName: "ÄLEBY", itemImage: "aleby"),
        ItemInfo(userName: "프랭키", itemName: "BROMMÖ", itemImage: "brommo"),
        ItemInfo(userName: "고양씨", itemName: "EKEDALEN", itemImage: "ekedalen"),
        ItemInfo(userName: "프랭키", itemName: "HATTEFJÄLL", itemImage: "hattefjall"),
        ItemInfo(userName: "뽀뽀", itemName: "MARKUS", itemImage: "markus"),
        ItemInfo(userName: "고양씨", itemName: "MILLBERGET", itemImage: "millberget"),
        ItemInfo(userName: "뽀뽀", itemName: "NORDMYRA", itemImage: "nordmyra"),
        ItemInfo(userName: "깜디", itemName: "NORRÅKER", itemImage: "norraker"),
        ItemInfo(userName: "깜디", itemName: "TUNHOLMEN", itemImage: "tunholmen"),
        ItemInfo(userName: "뽀뽀", itemName: "YPPERLIG", itemImage: "ypperlig"),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath)
        
        let item = items[indexPath.row]
        
        cell.textLabel?.text = item.itemName
        cell.detailTextLabel?.text = item.userName
        cell.imageView?.image = UIImage(named: item.itemImage)

        return cell
    }
}
