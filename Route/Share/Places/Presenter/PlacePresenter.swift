//
//  PlacePresenter.swift
//  Route
//
//  Created by Katherine Movile on 3/13/22.
//

import Foundation

final class PlacePresenter: PlacePresenterProtocol {

    weak var placeVC: PlaceViewControllerProtocol?
    var places = [Prediction]()

    func addPlaces(_ place: [Prediction]) {
        placeVC?.loadPlaceHandler(places)
    }

}
