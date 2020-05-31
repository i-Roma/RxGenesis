//
//  RxDemoModel.swift
//  RxGenesis
//
//  Created by Roman Romanenko on 30.05.2020.
//  Copyright © 2020 RR. All rights reserved.
//

import RxRelay

enum RxDemoModel {
    
    // MARK: Use cases

    enum Show {

        struct Response {
            var data: NosmicCurrenciesTickers
        }

        class ViewModel {
            var isLoading: BehaviorRelay<Bool>
            var title: BehaviorRelay<String>
            var representablePrice: BehaviorRelay<String>
            var marketCap: BehaviorRelay<String>
            
            init(isLoading: BehaviorRelay<Bool> = BehaviorRelay<Bool>(value: false), title: BehaviorRelay<String> = BehaviorRelay<String>(value: ""), representablePrice: BehaviorRelay<String> = BehaviorRelay<String>(value: ""), marketCap: BehaviorRelay<String> = BehaviorRelay<String>(value: "")) {
                
                self.isLoading = isLoading
                self.title = title
                self.representablePrice = representablePrice
                self.marketCap = marketCap
            }
        }
        
        struct Error {
            var reason: String
        }
    }

}

