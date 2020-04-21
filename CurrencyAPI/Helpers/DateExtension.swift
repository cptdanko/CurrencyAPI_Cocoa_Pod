//
//  Extensions.swift
//  CurrencyAPI
//
//  Created by Bhuman Soni on 21/4/20.
//  Copyright © 2020 Bhuman Soni. All rights reserved.
//

import Foundation

extension DateFormatter {
    static let yyyyMMdd: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.calendar = Calendar(identifier: .iso8601)
        //formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }()
}
