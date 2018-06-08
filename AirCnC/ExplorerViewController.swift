//
//  ExplorerViewController.swift
//  AirCnC
//
//  Created by Jaehoon Lee on 2018. 6. 8..
//  Copyright © 2018년 Jaehoon Lee. All rights reserved.
//

import UIKit

class ExplorerViewController: UITableViewController {
    // 테이블 뷰 데이터소스
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ReserveItem.items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath)
        
        let item = ReserveItem.items[indexPath.row]
        
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
            let item = ReserveItem.items[index.row]
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
