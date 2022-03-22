//
//  URL.swift
//  Route
//
//  Created by Katherine Movile on 3/13/22.
//

import Foundation

enum Endpoint: String {
    private var baseURL: String { return "https://maps.googleapis.com/maps/api/place/autocomplete" }

    case json = "/json"

    var url: URL {
        guard let url = URL(string: baseURL) else {
            preconditionFailure("The url used in \(Endpoint.json.self) is not valid")
        }
        return url.appendingPathComponent(self.rawValue)
    }
}
