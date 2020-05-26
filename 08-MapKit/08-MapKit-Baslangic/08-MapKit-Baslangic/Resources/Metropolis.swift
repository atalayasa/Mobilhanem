//
//  Buyuksehirler.swift
//  08-MapKit-Baslangic
//
//  Created by Atalay Aşa on 26.05.2020.
//  Copyright © 2020 Atalay Asa. All rights reserved.
//

import MapKit

class Metropolis: NSObject {
    var title: String?
    var subtitle: String?
    var coordinate: CLLocationCoordinate2D
    
    init(title: String?, subtitle: String?, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
    }
    
    static func getMetropolis() -> [Metropolis] {
        guard let path = Bundle.main.path(forResource: "Metropolis", ofType: "plist"), let array = NSArray(contentsOfFile: path) else { return [] }
        
        var places = [Metropolis]()
        
        for item in array {
            let dictionary = item as? [String : Any]
            let title = dictionary?["title"] as? String
            let subtitle = dictionary?["population"] as? String
            let latitude = dictionary?["latitude"] as? Double ?? 0, longitude = dictionary?["longitude"] as? Double ?? 0
            
            let place = Metropolis(title: title, subtitle: subtitle, coordinate: CLLocationCoordinate2DMake(latitude, longitude))
            places.append(place)
        }
        return places
    }
}
