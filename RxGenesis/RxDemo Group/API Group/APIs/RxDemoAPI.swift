//
//  RxDemoAPI.swift
//  RxGenesis
//
//  Created by Roman Romanenko on 30.05.2020.
//  Copyright © 2020 RR. All rights reserved.
//

struct NosmicAPI {
    static var key = "0268d8a1a59bf6e1e64b8b831b133e21"
    static var domain = "https://api.nomics.com"
    static var v1 = "/v1"
    
    struct currencies {
        private static let currencies = "/currencies"
        static var ticker = NosmicAPI.v1 + currencies + "/ticker"
    }
}
