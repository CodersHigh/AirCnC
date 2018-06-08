//
//  ExplorerCollectionViewController.swift
//  AirCnC
//
//  Created by wannabewize on 2018. 6. 8..
//  Copyright © 2018년 Jaehoon Lee. All rights reserved.
//

import UIKit

class ItemCell: UICollectionViewCell {
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
}

class ExplorerCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue",
            let detailVC = segue.destination as? ViewController,
            let cell = sender as? UICollectionViewCell,
            let index = self.collectionView!.indexPath(for: cell) {
            let item = ReserveItem.items[index.row]
            detailVC.item = item
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 3 - 2
        let height = width + 20
        return CGSize(width: width, height: height)
    }
    
    

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ReserveItem.items.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath) as! ItemCell
        
        cell.contentView.layer.borderColor = UIColor.gray.cgColor
        cell.contentView.layer.borderWidth = 0.5
        cell.contentView.layer.cornerRadius = 3
        
        let item = ReserveItem.items[indexPath.item]
        
        cell.itemImageView.image = UIImage(named: item.thumbnail)
        cell.itemNameLabel.text = item.name
        cell.userNameLabel.text = item.user.name
    
        return cell
    }

}
