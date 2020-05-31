//
//  NosmicTicker.swift
//
//  Created by Roman Romanenko
//

struct NosmicCurrenciesTicker: Codable {
    let id, currency, symbol, name: String
    let logoURL: String
    let price: String
    let priceDate: String
    let priceTimestamp: String
    let circulatingSupply, maxSupply, marketCap, rank: String?
    let high: String
    let highTimestamp: String
    let the1D, the7D, the30D, the365D, ytd: NosmicCurrenciesTickerChangesDetail?
    
    enum CodingKeys: String, CodingKey {
        case id, currency, symbol, name
        case logoURL = "logo_url"
        case price
        case priceDate = "price_date"
        case priceTimestamp = "price_timestamp"
        case circulatingSupply = "circulating_supply"
        case maxSupply = "max_supply"
        case marketCap = "market_cap"
        case rank, high
        case highTimestamp = "high_timestamp"
        case the1D = "1d"
        case the7D = "7d"
        case the30D = "30d"
        case the365D = "365d"
        case ytd
    }
}
