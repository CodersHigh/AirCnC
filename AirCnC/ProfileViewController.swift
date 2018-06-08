//
//  ProfileViewController.swift
//  AirCnC
//
//  Created by wannabewize on 2018. 6. 8..
//  Copyright © 2018년 Jaehoon Lee. All rights reserved.
//

import UIKit

class ReserveCell: UITableViewCell {
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var reserveDateLabel: UILabel!
}

class ProfileViewController: UIViewController {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var dateFormatter: DateFormatter!
    
    // 화면 전환시마다 업데이트
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    @IBAction func editProfileImage(_ sender: Any) {
        let picker = UIImagePickerController()
        // 델리게이트를 이용한 모달 결과 다루기
        picker.delegate = self
        // 사진 선택 후 편집 가능
        picker.allowsEditing = true
        self.present(picker, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        
        nameLabel.text = "프랭키"
        locationLabel.text = "한국"
        
        profileImageView.layer.cornerRadius = profileImageView.frame.size.width / 2
        profileImageView.clipsToBounds = true
        profileImageView.image = #imageLiteral(resourceName: "franky_profile")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let editedImage = info[UIImagePickerControllerEditedImage] as? UIImage {
            profileImageView.image = editedImage
        }
        else {
            let originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            profileImageView.image = originalImage
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
}

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Reservation.shared.reserves.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReserveCell", for: indexPath) as! ReserveCell
        
        let reserve = Reservation.shared.reserves[indexPath.row]
        
        cell.itemImageView.image = UIImage(named: reserve.item.thumbnail)
        cell.itemNameLabel.text = reserve.item.name
        
        let plateAttr = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 13)]
        let dateAttr = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.semibold),
                        NSAttributedStringKey.foregroundColor: UIColor(red: CGFloat(82)/256, green: CGFloat(162)/256, blue: CGFloat(255)/256, alpha: 1.0) ]
        
        let dateStr = NSMutableAttributedString(string: "from ", attributes: plateAttr)
        dateStr.append(NSAttributedString(string:dateFormatter.string(from: reserve.startDate), attributes:dateAttr))
        dateStr.append(NSAttributedString(string:"  to  ", attributes:plateAttr))
        dateStr.append(NSAttributedString(string:dateFormatter.string(from: reserve.endDate), attributes:dateAttr))
        
        cell.reserveDateLabel.attributedText = dateStr
            
            //"from \(dateFormatter.string(from: reserve.startDate))  to \(dateFormatter.string(from: reserve.endDate))"
        
        return cell
    }
}
