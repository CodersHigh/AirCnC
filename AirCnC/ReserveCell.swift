//
//  ReserveCell.swift
//  AirCnC
//
//  Created by wannabewize on 2018. 7. 11..
//  Copyright © 2018년 Jaehoon Lee. All rights reserved.
//

import UIKit

class ReserveCell: UITableViewCell {
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var reserveDateLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
