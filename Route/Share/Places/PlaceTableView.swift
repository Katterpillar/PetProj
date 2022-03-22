//
//  PlaceTableView.swift
//  Route
//
//  Created by Katherine Movile on 3/13/22.
//

import Foundation
import UIKit

extension GooglePlacesViewController: UITableViewDataSource, UITableViewDelegate{

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayPlaces.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tblCell = tableView.dequeueReusableCell(withIdentifier: "locationCell")
		tblCell?.textLabel?.text = arrayPlaces[indexPath.row].predictionDescription
        tblCell?.textLabel?.numberOfLines = 0
        tblCell?.textLabel?.sizeToFit()
        return tblCell!
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
//        if LocationDataDelegate != nil
//        {
//            let dict = arrayPlaces.object(at: indexPath.row) as! NSDictionary
//            print(dict.value(forKey: "terms") as! NSArray)
//            let ArrSelected = dict.value(forKey: "terms") as! NSArray
//            LocationDataDelegate.didSelectLocationData(LocationData: ArrSelected)
//        }
		self.navigationController?.popViewController(animated: true)
    }
}
