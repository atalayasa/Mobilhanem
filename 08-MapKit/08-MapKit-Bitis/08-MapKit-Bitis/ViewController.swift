//
//  ViewController.swift
//  08-MapKit-Bitis
//
//  Created by Atalay Aşa on 26.05.2020.
//  Copyright © 2020 Atalay Asa. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    let locationManager = CLLocationManager()
    let metropolises = Metropolis.getMetropolis()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.showsUserLocation = true
        requestUserLocation()
        
        addAnnotations()
        addShape()
    }
    
    func requestUserLocation() {
        // 1
        let status = CLLocationManager.authorizationStatus()
        
        switch status {
        // 2
        case .authorizedAlways, .authorizedWhenInUse:
            return
        // 3
        case .denied, .restricted:
            print("Konum izni reddedildi")
        default:
            // 4
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    func addAnnotations() {
        mapView.delegate = self
        mapView.addAnnotations(metropolises)
    }
    
    func addShape() {
        let shapes = metropolises.compactMap { MKCircle.init(center: $0.coordinate, radius: 500 )}
        mapView?.addOverlays(shapes)
    }
    
}

extension ViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        // 1
        if annotation is MKUserLocation {
            return nil
        } else {
        // 2
            let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "annotationView") ?? MKAnnotationView()
            annotationView.image = UIImage(named: "locationPin")
            return annotationView
        }
    }
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        // 1
        let renderer = MKCircleRenderer(overlay: overlay)
        // 2
        renderer.fillColor = UIColor.black.withAlphaComponent(0.6)
        // 3
        renderer.strokeColor = .orange
        // 4
        renderer.lineWidth = 2
        return renderer
    }
}
