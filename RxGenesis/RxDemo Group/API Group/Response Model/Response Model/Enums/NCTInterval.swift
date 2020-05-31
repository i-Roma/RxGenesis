//
//  NCTInterval.swift
//
//  Created by Roman Romanenko
//

import Foundation

/// Nosmic Currencies Tickers Interval
enum NCTInterval: String {
    case hour  = "1h"
    case day   = "1d"
    case week  = "7d"
    case month = "30d"
    case year  = "365d"
    case ytd   = "ytd"
}
