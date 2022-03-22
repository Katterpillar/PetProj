//
//  ListVCProtocol.swift
//  Route
//
//  Created by Katherine Movile on 3/13/22.
//

import Foundation

protocol ListViewControllerProtocol: AnyObject {
    /// Слой нетровкинга
    var listNetworking: ListNetworkingProtocol? { get set }
    
    /// Перезагружает таблицу
    func reloadTableView()
    
    /// Загружает позицию
    func loadRouteHandler(_ routes: [RouteInfo])
    
    /// Обновляет геопозицию и время
    func updateRouteHandler(_ routes: [RouteInfo])
}
