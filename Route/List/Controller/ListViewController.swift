//
//  ListViewController.swift
//  Route
//
//  Created by Katherine Movile on 3/13/22.
//

import UIKit
import AVFAudio

final class ListViewController: UIViewController, ListViewControllerProtocol {

    var listNetworking: ListNetworkingProtocol?

    lazy var emptyListView = EmptyListView(self)
    var routes = [RouteInfo]()

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

    private let calendar = Calendar(identifier: .gregorian)
    private let sharingButton: UIBarButtonItem = {
        let button = UIBarButtonItem(image: UIImage(systemName: "square.and.pencil"),
                                                    style: .plain,
                                                    target: self,
                                                    action: #selector(newShareTapped))

        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadRouteList()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tabBarController?.tabBar.isHidden = false
    }

    private func setupUI(){
        navigationItem.title = "List"
        view.backgroundColor = .white

        view.addSubviews(tableView)
        tableView.pinToSuperView()

        tableView.delegate = self
        tableView.dataSource = self

        setupSharingButton()
        setRefresh(true)
    }

    private func setupSharingButton() {
        navigationItem.rightBarButtonItem = sharingButton
    }

    func loadRouteList(){
		listNetworking?.observeRouteList()
    }

	func loadRouteHandler(_ routes: [RouteInfo]) {
		self.routes = routes
		tableView.reloadData()
	}

    func updateRouteHandler(_ routes: [RouteInfo]) {
        self.routes = routes
        setRefresh(false)
        reloadTableView()
    }

    func setRefresh(_ active: Bool){
        DispatchQueue.main.async {
            guard self.tableView.refreshControl != nil else {
                return
            }

            if active{
                self.tableView.refreshControl?.beginRefreshing()
            } else {
                self.tableView.refreshControl?.endRefreshing()
            }
        }
    }


    func reloadTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

    func observeStateHandler(_ recent: RouteInfo, _ cell: RouteCell){
        listNetworking?.observeRouteUpdate(recent.id, completion: { lastUpdate , location in
            cell.route.lastUpdate = lastUpdate
            cell.route.location = location
        })
    }


    // MARK: objc-func

    @objc func refresh(_ sender: AnyObject) {
        loadRouteList()
    }

    @objc func newShareTapped() {
        let controller = ShareViewController()
        present(UINavigationController(rootViewController: controller), animated: true, completion: nil)
    }

}
