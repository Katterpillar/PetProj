//
//  PlaceViewController.swift
//  Route
//
//  Created by Katherine Movile on 3/13/22.
//

import Foundation
import UIKit
import Alamofire

final class GooglePlacesViewController: UIViewController, PlaceViewControllerProtocol, UISearchBarDelegate {

    var placeNetworking: PlaceNetworkingProtocol?

    lazy var arrayPlaces = [Prediction]() {
        didSet {
            tableView.backgroundView = (arrayPlaces.count == 0) ? emptyListView : nil
        }
    }

    private let operationQueue = OperationQueue()

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = 80
        tableView.backgroundColor = .clear
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.register(RouteCell.self, forCellReuseIdentifier: "RouteCell")

        let refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(ListViewController.refresh(_:)), for: .valueChanged)
        tableView.refreshControl = refreshControl

        return tableView
    }()

    private var searchBar: UISearchBar?

    private var emptyListView: EmptyListView!

    override func viewDidLoad() {
        super.viewDidLoad()
        makeSearchBar()
		tableView.delegate = self
		tableView.dataSource = self
    }

    private func makeSearchBar() {
        searchBar = UISearchBar()
        searchBar?.delegate = self
        if let textField = searchBar?.value(forKey: "searchField") as? UITextField {
            textField.backgroundColor = .white
            textField.tintColor = .black
        }
        navigationItem.titleView = searchBar
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.beginSearching(searchText: searchText)
    }

    func beginSearching(searchText: String) {
        if searchText.count == 0 {
            self.arrayPlaces.removeAll()
            return
        }

        operationQueue.addOperation { () -> Void in
            self.placeNetworking?.updatePlaceList(input: searchText)
        }
    }

    func loadPlaceHandler(_ place: [Prediction]) {
        self.arrayPlaces = place
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
