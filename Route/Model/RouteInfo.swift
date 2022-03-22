//
//  UnitInfo.swift
//  Route
//
//  Created by Katherine Movile on 3/13/22.
//

import Foundation
import CoreLocation

struct RouteInfo {

    let id: String
    let name: String
    var location: CLLocationCoordinate2D?
    let beginPoint: TargetPoint
    let endPoint: TargetPoint
    var lastUpdate: Date?

    init?(_ dict: [String:Any]) {

        guard let id = dict["id"] as? String else { return nil }
        guard let name = dict["name"] as? String else { return nil }

        guard let latitude = dict["latitude"] as? Double else { return nil }
        guard let longitude = dict["longitude"] as? Double else { return nil }

        guard let beginPoint = dict["beginPoint"] as? [String: Any] else { return nil }
        guard let endEnd = dict["endEnd"] as? [String: Any] else { return nil }
        
        guard let lastUpdate = dict["lastUpdate"] as? NSNumber else { return nil }

        guard let begin = TargetPoint(beginPoint) else { return nil }
        guard let end = TargetPoint(endEnd) else { return nil }

        self.beginPoint = begin
        self.endPoint = end

        self.id = id
        self.name = name

        self.location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)

        self.lastUpdate = Date(timeIntervalSinceReferenceDate: TimeInterval(lastUpdate.doubleValue))
    }
}
