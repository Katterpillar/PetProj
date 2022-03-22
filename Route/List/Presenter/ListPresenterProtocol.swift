//
//  ListPresenterProtocol.swift
//  Route
//
//  Created by Katherine Movile on 3/13/22.
//

import Foundation

protocol ListPresenterProtocol {
    var listVC: ListViewControllerProtocol? { get set }

    func addRoutes(_ routes: RouteInfo)
    func removeRoute(idToRemove: String)

}
