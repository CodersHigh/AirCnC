//
//  ExplorerViewController.swift
//  AirCnC
//
//  Created by Jaehoon Lee on 2018. 6. 8..
//  Copyright © 2018년 Jaehoon Lee. All rights reserved.
//

import UIKit

class ExplorerViewController: UITableViewController {
    var items = [
        Item(name: "ÄLEBY", thumbnail: "aleby",
                 detailImage: ["aleby_1", "aleby_2", "aleby_3", "aleby_4", "aleby_5", "aleby_6", "aleby_7"],
                 price: 34000, size: Size(w: 86, d: 88, h: 101),
                 user: User.ggamdi),
        Item(name: "BROMMÖ", thumbnail: "brommo",
                 detailImage: ["brommo_1", "brommo_2", "brommo_3", "brommo_4", "abrommo_5"],
                 price: 8000, size: Size(w: 48, d: 92, h: 89),
                 user: User.franky),
        Item(name: "EKEDALEN", thumbnail: "ekedalen",
                 detailImage: ["ekedalen_1", "ekedalen_2", "ekedalen_3", "ekedalen_4", "ekedalen_5"],
                 price: 6000, size: Size(w: 43, d: 51, h: 95),
                 user: User.goyangci),
        Item(name: "HATTEFJÄLL", thumbnail: "hattefjall",
                 detailImage: ["hattefjall_1", "hattefjall_2", "hattefjall_3", "hattefjall_4", "hattefjall_5"],
                 price: 23000, size: Size(w: 68, d: 68, h: 110),
                 user: User.franky),
        Item(name: "MARKUS", thumbnail: "markus",
                 detailImage: ["markus_1", "markus_2", "markus_3", "markus_4", "markus_5", "markus_6", "markus_7"],
                 price: 20000, size: Size(w: 62, d: 60, h: 140),
                 user: User.popo),
        Item(name: "MILLBERGET", thumbnail: "millberget",
                 detailImage: ["millberget_1", "millberget_2", "millberget_3", "millberget_4", "millberget_5", "millberget_6"],
                 price: 8000, size: Size(w: 52, d: 65, h: 123),
                 user: User.goyangci),
        Item(name: "NORDMYRA", thumbnail: "nordmyra",
                 detailImage: ["nordmyra_1", "nordmyra_2", "nordmyra_3"],
                 price: 5000, size: Size(w: 45, d: 48, h: 80),
                 user: User.popo),
        Item(name: "NORRÅKER", thumbnail: "norraker",
                 detailImage: ["norraker_1", "norraker_2", "norraker_3", "norraker_4", "norraker_5", "norraker_6"],
                 price: 8000, size: Size(w: 41, d: 50, h: 81),
                 user: User.ggamdi),
        Item(name: "TUNHOLMEN", thumbnail: "tunholmen",
                 detailImage: ["tunholmen_1", "tunholmen_2", "tunholmen_3", "tunholmen_4", "tunholmen_5"],
                 price: 8000, size: Size(w: 55, d: 55, h: 78),
                 user: User.ggamdi),
        Item(name: "YPPERLIG", thumbnail: "ypperlig",
                 detailImage: ["ypperlig_1", "ypperlig_2", "ypperlig_3", "ypperlig_4", "ypperlig_5", "ypperlig_6", "ypperlig_7"],
                 price: 8000, size: Size(w: 55, d: 51, h: 83),
                 user: User.popo)
    ]

    // 테이블 뷰 데이터소스
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath)
        
        let item = items[indexPath.row]
        
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = item.user.name
        cell.imageView?.image = UIImage(named: item.thumbnail)

        return cell
    }
    
    // 상세씬 전환
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue",
            let detailVC = segue.destination as? ViewController,
            let cell = sender as? UITableViewCell,
            let index = self.tableView.indexPath(for: cell) {
            let item = items[index.row]
            detailVC.item = item
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
