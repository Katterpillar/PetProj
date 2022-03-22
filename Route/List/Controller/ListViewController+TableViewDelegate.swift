//
//  ListTableView.swift
//  Route
//
//  Created by Katherine Movile on 3/13/22.
//

import Foundation

import UIKit
import Firebase

extension ListViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return routes.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RouteCell") as! RouteCell
        
        cell.selectionStyle = .none
        cell.listViewController = self
        cell.route = routes[indexPath.row]

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! RouteCell
        let route = cell.route
        nextControllerHandler(route: route!)
    }

        func nextControllerHandler(route: RouteInfo) {
    //        let controller = InfoVC()
    //        controller.modalPresentationStyle = .fullScreen
    //        present(controller, sender: nil)
        }

}
