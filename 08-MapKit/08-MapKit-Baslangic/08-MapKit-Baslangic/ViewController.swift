//
//  ViewController.swift
//  08-MapKit-Baslangic
//
//  Created by Atalay Aşa on 26.05.2020.
//  Copyright © 2020 Atalay Asa. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

