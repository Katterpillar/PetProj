//
//  ListPresenter.swift
//  Route
//
//  Created by Katherine Movile on 3/13/22.
//

import Foundation

final class ListPresenter: ListPresenterProtocol {

    weak var listVC: ListViewControllerProtocol?

    var routes = [RouteInfo]()

    func removeRoute(idToRemove: String) {
        if let firstIndex = routes.firstIndex(where: { $0.id == idToRemove}){
            routes.remove(at: firstIndex)
        }

        listVC?.updateRouteHandler(routes)
    }

    func addRoutes(_ route: RouteInfo) {
        if self.routes.contains(where: { $0.id == route.id}){
            return
        }

        if let place = self.routes.firstIndex(where: { $0.lastUpdate?.compare(route.lastUpdate ?? Date()) == .orderedDescending }){
            self.routes.insert(contentsOf: routes, at: place)
        }

        listVC?.updateRouteHandler(routes)
    }

}
