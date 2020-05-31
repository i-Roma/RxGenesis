//
//  RxDemoAPIWorker.swift
//  RxGenesis
//
//  Created by Roman Romanenko on 31.05.2020.
//  Copyright © 2020 RR. All rights reserved.
//

import RxSwift

protocol RxDemoAPIWorkerProtocol: AnyObject {
    func requestData(for value: String) -> Observable<NosmicCurrenciesTickers>
}

class RxDemoAPIWorker: RxDemoAPIWorkerProtocol {

    // MARK: Dependency
    
    private let apiProvider = URLSessionProvider()
    
    // MARK: Life cycle
    
    init() {}
    
    // MARK: Methods
    
    
    func requestData(for value: String) -> Observable<NosmicCurrenciesTickers> {
        return Observable.create { observer in

                let apiService = RxDemoAPIService.configTickerPathWith(.day, [value], .USD)
                self.apiProvider.request(from: apiService, responseType: NosmicCurrenciesTickers.self) { response in

                    switch response {
                    case let .success(result):

                        #if DEBUG
                            //print(#function, result)
                        #endif

                        observer.on(.next(result))
                        
                    case let .failure(error):

                        #if DEBUG
                            //print(#function, "--- \(error.rawValue) ---")
                        #endif

                        observer.on(.error(error))
                        
                    default:
                        break
                    }

                    observer.on(.completed)
                }

            return Disposables.create {}
        }
    }
    
}

