//
//  PlasesAssemler.swift
//  Route
//
//  Created by Katherine Movile on 3/13/22.
//

import Foundation
import UIKit

final class PlasesAssemler {
    func assemly() -> UIViewController {
        let plasesVC = GooglePlacesViewController()
        let plasesNetworking = PlaceNetworking()
        let plasesPresenter = PlacePresenter()
        plasesVC.placeNetworking = plasesNetworking
        plasesNetworking.presenter = plasesPresenter
        plasesPresenter.placeVC = plasesVC
        return plasesVC
    }
}
