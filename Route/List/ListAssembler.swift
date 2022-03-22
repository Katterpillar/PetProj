//
//  ListAssembler.swift
//  Route
//
//  Created by Katherine Movile on 3/13/22.
//

import Foundation
import UIKit

final class ListAssembler {
    func assemly() -> UIViewController {
        let listVC = ListViewController()
        let listNetworking = ListNetworking()
        let listPresenter = ListPresenter()
        listVC.listNetworking = listNetworking
        listNetworking.listPresenter = listPresenter
        listPresenter.listVC = listVC
        return listVC
    }
}
