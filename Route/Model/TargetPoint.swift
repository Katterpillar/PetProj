//
//  TargetLocation.swift
//  Route
//
//  Created by Katherine Movile on 3/13/22.
//

import Foundation
import CoreLocation

struct TargetPoint {

    let name: String
    let location: CLLocationCoordinate2D

    init?(_ dict: [String:Any]) {

        guard let name = dict["name"] as? String else { return nil }
        guard let latitude = dict["latitude"] as? Double else { return nil }
        guard let longitude = dict["longitude"] as? Double else { return nil }

        self.name = name
        self.location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}

