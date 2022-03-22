//
//  PlacePresenterProtocol.swift
//  Route
//
//  Created by Katherine Movile on 3/13/22.
//

import Foundation

protocol PlacePresenterProtocol {

    var placeVC: PlaceViewControllerProtocol? { get set }

    func addPlaces(_ place: [Prediction])

}
