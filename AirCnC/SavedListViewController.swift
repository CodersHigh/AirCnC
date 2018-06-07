//
//  SavedListViewController.swift
//  AirCnC
//
//  Created by Jaehoon Lee on 2018. 4. 13..
//  Copyright © 2018년 wannabewize. All rights reserved.
//

import UIKit

class SavedTableViewController: UITableViewController {
    
    var appDelegate: AppDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        appDelegate.removeSave( appDelegate.saves[indexPath.row] )
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appDelegate.saves.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SavedCell", for: indexPath)
        
        let item = appDelegate.saves[indexPath.row]
        
        cell.textLabel?.text = item.itemName
        cell.imageView?.image = UIImage(named: item.itemImage)

        return cell
    }
}
