//
//  PlaceNetworkingProtocol.swift
//  Route
//
//  Created by Katherine Movile on 3/13/22.
//

import Foundation
import CoreLocation

protocol PlaceNetworkingProtocol {

    var presenter: PlacePresenterProtocol? { get set }

    func updatePlaceList(input: String)

}
