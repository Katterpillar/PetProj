//
//  PlaceControllerProtocol.swift
//  Route
//
//  Created by Katherine Movile on 3/13/22.
//

import Foundation

protocol PlaceViewControllerProtocol: AnyObject {

    var placeNetworking: PlaceNetworkingProtocol? { get set }

    func loadPlaceHandler(_ place: [Prediction])
}
