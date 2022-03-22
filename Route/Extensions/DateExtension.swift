//
//  DateExtension.swift
//  Route
//
//  Created by Katherine Movile on 20.03.2022.
//

import Foundation

struct CustomDateFormatter {
    static func formateDate(from date: Date?) -> String {
        guard let date = date else {
            return "00:00"
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.mmm HH:MM"
        return dateFormatter.string(from: date)
    }
}
