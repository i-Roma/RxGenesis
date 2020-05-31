//
//  NosmicTickerChangesDetail.swift
//
//  Created by Roman Romanenko
//

struct NosmicCurrenciesTickerChangesDetail: Codable {
    let marketCapChange, marketCapChangePct, priceChange, priceChangePct: String?
    let volume, volumeChange, volumeChangePct: String?
    
    enum CodingKeys: String, CodingKey {
        case marketCapChange = "market_cap_change"
        case marketCapChangePct = "market_cap_change_pct"
        case priceChange = "price_change"
        case priceChangePct = "price_change_pct"
        case volume
        case volumeChange = "volume_change"
        case volumeChangePct = "volume_change_pct"
    }
}
