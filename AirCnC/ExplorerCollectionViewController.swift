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

class ExplorerCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout, UISearchControllerDelegate, UISearchResultsUpdating {
    
    var searched: [Item] = []
    
    func willPresentSearchController(_ searchController: UISearchController) {
        print("willPresentSearchController")
    }
    
    func willDismissSearchController(_ searchController: UISearchController) {
        print("willDismissSearchController")
    }
    
    func didPresentSearchController(_ searchController: UISearchController) {
        print("didPresentSearchController")
    }
    
    func didDismissSearchController(_ searchController: UISearchController) {
        print("didDismissSearchController")
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        let keyword = searchController.searchBar.text!
        searched.removeAll()
        searched = ReserveItem.items.filter({ (item) -> Bool in
            return item.name.lowercased().contains(keyword.lowercased()) || item.user.name.lowercased().contains(keyword.lowercased())
        })
        collectionView?.reloadData()
    }

    var searchController: UISearchController!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 동일한 신을 검색 결과로 사용하는 경우에는 nil로 생성
        searchController = UISearchController(searchResultsController: nil)
        searchController.delegate = self
        searchController.searchResultsUpdater = self
        
        searchController.dimsBackgroundDuringPresentation = false
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = false

        // 내비게이션 바에 결합하기
        self.navigationItem.searchController = searchController
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
        if searchController.isActive {
            return searched.count
        }
        else {
            return ReserveItem.items.count
        }
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath) as! ItemCell
        
        cell.contentView.layer.borderColor = UIColor.gray.cgColor
        cell.contentView.layer.borderWidth = 0.5
        cell.contentView.layer.cornerRadius = 3
        
        let item: Item
        if searchController.isActive {
            item = searched[indexPath.item]
        }
        else {
            item = ReserveItem.items[indexPath.item]
        }
        
        cell.itemImageView.image = UIImage(named: item.thumbnail)
        cell.itemNameLabel.text = item.name
        cell.userNameLabel.text = item.user.name
    
        return cell
    }
}
