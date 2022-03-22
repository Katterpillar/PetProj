//
//  MapViewController.swift
//  Route
//
//  Created by Katherine Movile on 3/13/22.
//

import UIKit
import SnapKit
import GoogleMaps
import CoreLocation

class MapViewController: UIViewController, UIGestureRecognizerDelegate, GMSMapViewDelegate {

    var routeCoordinates = [String: CLLocationCoordinate2D]()

    var locationManager = CLLocationManager()

    private let infoMap = UIView()
    private let mapView = GMSMapView()
    private var exitButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        checkStatus()
        navigationController?.interactivePopGestureRecognizer?.delegate = self
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
        navigationController?.navigationBar.isHidden = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        tabBarController?.tabBar.isHidden = false
        navigationController?.navigationBar.isHidden = false
    }

    private func checkStatus(){
        let manager = CLLocationManager()
        switch manager.authorizationStatus {
            case .authorizedWhenInUse:
                setupMapView()
            case .denied:
                AlertHelper.showAlertWithTitle(self, title: "Авторизация",
                                               dismissButtonTitle: "Окей",
                                               dismissAction: { print("Запросить авторизацию") })
            default:
                break
        }
    }

    private func setupMapView(){
        view.addSubview(mapView)
        mapView.frame = view.bounds
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.snp.makeConstraints({ make in
            make.bottom.leading.trailing.equalToSuperview()
            make.top.equalTo(-8.0)
        })

        mapView.delegate = self
    }

    @objc func exitButtonPressed(){
        navigationController?.popViewController(animated: true)
    }

}
