//
//  PlaceNetwork.swift
//  Route
//
//  Created by Katherine Movile on 3/13/22.
//

import Foundation
import Alamofire


final class PlaceNetworking: PlaceNetworkingProtocol {

    var presenter: PlacePresenterProtocol?

    func updatePlaceList(input: String) {

            let parameters: [String: Any] = [
                "input": input,
                "types": "geocode",
                "language": "en",
                "key": "YOUR_API_KEY"
            ]

            AF.request(Endpoint.json.url, method: .get, parameters: parameters, encoding: URLEncoding(destination: .queryString), headers: nil, interceptor: EnvironmentInterceptor())
                .responseDecodable { (response: DataResponse<GooglePlace, AFError>) in
                        if let status = response.response?.statusCode{
                        switch status {
                        case 200:
                            if let places = response.value{
								self.presenter?.addPlaces(places.predictions)
                            }
                        default:
                            if let data = response.data {
                                 AlertHelper.showAlertWithData(data: data, dismissButtonTitle: "OK"){ () -> Void in

                                }
                            }
                        }
                    }
                }
    }

}
