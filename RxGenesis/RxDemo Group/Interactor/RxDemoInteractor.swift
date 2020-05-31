//
//  RxDemoInteractor.swift
//  RxGenesis
//
//  Created by Roman Romanenko on 30.05.2020.
//  Copyright © 2020 RR. All rights reserved.
//

import RxSwift
import RxRelay

// MARK: - Interactor's worker protocol

protocol RxDemoBusinessLogic {
    var isLoading: BehaviorRelay<Bool> { get set }
    var inputValue: BehaviorRelay<String> { get set }
}

// MARK: - Share data provider

protocol RxDemoShareDataProtocol {
    // declare smth to pass/share data between modules
}

// MARK: - Interactor

class RxDemoInteractor: RxDemoBusinessLogic, RxDemoShareDataProtocol {

    // MARK: Workers
    
    private let apiProvider = URLSessionProvider()
    private let apiWorker = RxDemoAPIWorker()
    
    // MARK: Dependencies
    
    var presenter: RxDemoPresenter?
        
    // MARK: Variables
    
    private var disposeBag = DisposeBag()
    var inputValue = BehaviorRelay<String>(value: "")
    var isLoading = BehaviorRelay<Bool>(value: true)

    // MARK: Life cycle
    
    init() {
        observeInputValue()
    }
    
    // MARK: - RxDemoBusinessLogic
    
    private func observeInputValue() {
        
        let observeInputValue = inputValue.asObservable()
            .filter { value in
                
                guard value.count != 0 else {
                    self.presenter?.clearView()
                    return false
                }
                return value.count == 3
                
            }.subscribe { result in
                
                guard let value = result.element else { return }
                self.requestData(for: value)
                
            }
        
        observeInputValue.disposed(by: disposeBag)
    }
    
    private func requestData(for value: String) {
        
        presenter?.isLoading(value: true)

        let requestData = apiWorker.requestData(for: value).subscribe(
            onNext: { [unowned self] data in

                let response = RxDemoModel.Show.Response(data: data)
                self.presenter?.presentData(response: response)
                
            },
            onError: { error in

                let error = RxDemoModel.Show.Error(reason: "An error has occurred while handling your request")
                self.presenter?.presentDataFailed(error: error)
                
            },
            onCompleted: {
                
                self.presenter?.isLoading(value: false)
                
            }
        )
        
        requestData.disposed(by: disposeBag)
    }

}

