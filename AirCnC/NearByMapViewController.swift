//
//  NearByMapViewController.swift
//  AirCnC
//
//  Created by LingoStar on 28/10/2018.
//  Copyright © 2018 Jaehoon Lee. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

struct ChairPOI {
    let name:String
    let location:CLLocationCoordinate2D
    let desc:String
}

class NearByMapViewController: UIViewController {
    
    @IBOutlet weak var nearByMapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let initialRegion = MKCoordinateRegionMake(CLLocationCoordinate2DMake(37.7859, -122.4400), MKCoordinateSpanMake(0.07, 0.07))
        nearByMapView.setRegion(initialRegion, animated: true)
        
        let filePath = Bundle.main.path(forResource: "info", ofType: "json")
        do {
            let jsonString = try String(contentsOfFile: filePath ?? "")
            print (jsonString)
        } catch {}
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

