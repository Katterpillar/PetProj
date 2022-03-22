//
//  ListNetworking.swift
//  Route
//
//  Created by Katherine Movile on 3/13/22.
//

import UIKit
import Firebase
import AVFoundation
import CoreLocation

final class ListNetworking: ListNetworkingProtocol {

    var listPresenter: ListPresenterProtocol?

    func observeRouteList() {
        Database.database().reference().child("route").observeSingleEvent(of: .value) { (snap) in
            for child in snap.children{
                guard let snapshot = child as? DataSnapshot else { return }
                guard let data = snapshot.value as? [String:Any] else { return }
                if let route = RouteInfo(data){
                    self.listPresenter?.addRoutes(route)
                }
            }
        }
    }

    func observeDeletedRoute() {
        Database.database().reference().child("route").observe(.childRemoved) { (snap) in
            self.listPresenter?.removeRoute(idToRemove: snap.key)
        }
    }

    func observeRouteUpdate(_ routeId: String, completion: @escaping (Date?, CLLocationCoordinate2D) -> Void) {
        let ref = Database.database().reference().child("route").child(routeId)
        ref.observe(.value) { (snap) in
            guard let data = snap.value as? [String: Any] else { return }

            guard let lastUpdate = data["lastUpdate"] as? NSNumber else { return }

            guard let latitude = data["latitude"] as? Double else { return }
            guard let longitude = data["longitude"] as? Double else { return }

            let lastDate = Date(timeIntervalSinceReferenceDate: TimeInterval(lastUpdate.doubleValue))

            let location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)

            return completion(lastDate, location)
        }
    }

}
