//
//  ListNetworkingProtocol.swift
//  Route
//
//  Created by Katherine Movile on 3/13/22.
//

import Foundation
import CoreLocation

protocol ListNetworkingProtocol {
    var listPresenter: ListPresenterProtocol? { get set }
    
    func observeRouteList()
    func observeDeletedRoute()
    func observeRouteUpdate(_ routeId: String,
                            completion: @escaping (_ lastUpdate: Date?,
                                                   _ coordinate: CLLocationCoordinate2D) -> Void)
}
