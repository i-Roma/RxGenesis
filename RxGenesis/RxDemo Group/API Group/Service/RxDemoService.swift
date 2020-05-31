//
//  RxDemoService.swift
//  RxGenesis
//
//  Created by Roman Romanenko on 30.05.2020.
//  Copyright © 2020 RR. All rights reserved.
//

enum RxDemoAPIService {
    case configTickerPathWith(_ interval: NCTInterval = .day, _ coins: [String] = ["BTC"], _ convertTo: NCTConvert = .USD)
}

extension RxDemoAPIService: APIServiceProtocol {
    
    var path: String {
        return NosmicAPI.currencies.ticker
    }
    
    var method: HTTPMethod {
        return .post
    }
    
    var requestType: RequestType  {
        switch self {
        case let .configTickerPathWith(interval, coins, convertTo):
            
            let parameters = [
                "key" : NosmicAPI.key,
                "ids" : (coins.map{ $0.uppercased() }.joined(separator: ",")),
                "interval": interval.rawValue,
                "convert" : convertTo.rawValue
            ] as [String : Any]
            
            return .with(parameters)
        }
    }
    
    var parametersEncoding: ParametersEncoding {
        return .url
    }
    
}
