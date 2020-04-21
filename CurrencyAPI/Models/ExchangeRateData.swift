//
//  ExchangeRateData.swift
//  CurrencyAPI
//
//  Created by Bhuman Soni on 19/4/20.
//  Copyright © 2020 Bhuman Soni. All rights reserved.
//

import Foundation

public class ExchangeRateData: Codable {
    
    public var base: String?
    public var date: Date?
    public var timeLastUpdated: Date!
    public var rates: [String: Double]?
    
    private enum CodingKeys: String, CodingKey {
        case base
        case date
        case timeLastUpdated = "time_last_updated"
        case rates
    }
        
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        base = try container.decode(String.self, forKey: .base)
        let dateStr = try container.decode(String.self, forKey: .date)
        let formatter = DateFormatter.yyyyMMdd
        if let d = formatter.date(from: dateStr) {
            self.date = d
        } else {
            throw DecodingError.dataCorruptedError(forKey: .date,
                  in: container,
                  debugDescription: "Date string does not match format expected by formatter.")
        }
        let lastUpdateInt = try container.decode(Int64.self, forKey: .timeLastUpdated)
        timeLastUpdated = Date(timeIntervalSince1970: Double(lastUpdateInt))
        rates = try container.decode([String: Double].self, forKey: .rates)
    }
}

