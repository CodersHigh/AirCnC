//
//  ViewController.swift
//  AirCnC
//
//  Created by Jaehoon Lee on 2018. 6. 7..
//  Copyright © 2018년 Jaehoon Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var depthLabel: UILabel!
    @IBOutlet weak var widthLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        imageView.image = UIImage.init(named: "hattefjall")
        
        titleLabel.text = "HATTEFJÄLL"
        
        userImageView.image = #imageLiteral(resourceName: "franky")
        userNameLabel.text = "프랭키"
        
        priceLabel.text = "10,000"
        depthLabel.text = "68cm"
        widthLabel.text = "68cm"
        heightLabel.text = "110cm"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

