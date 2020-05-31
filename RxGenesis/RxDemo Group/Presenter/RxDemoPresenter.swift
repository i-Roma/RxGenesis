//
//  RxDemoPresenter.swift
//  RxGenesis
//
//  Created by Roman Romanenko on 30.05.2020.
//  Copyright © 2020 RR. All rights reserved.
//

import UIKit
import RxRelay

// MARK: - Presenter's worker protocol

protocol RxDemoPresentationLogic {
    func isLoading(value: Bool)
    func presentData(response: RxDemoModel.Show.Response)
    func presentDataFailed(error: RxDemoModel.Show.Error)
    func clearView()
}

// MARK: - Presenter

class RxDemoPresenter: RxDemoPresentationLogic {

    // MARK: Scene interface
    
    weak var scene: RxDemoInterface?
    var viewModel = RxDemoModel.Show.ViewModel()
        
    // MARK: RxDemoPresentationLogic

    func presentData(response: RxDemoModel.Show.Response) {
        
        guard let data = response.data.first else {
            DispatchQueue.main.async {
                self.scene?.clearView()
                self.scene?.displayDataFailed(
                    error: RxDemoModel.Show.Error(reason: "An error has occurred while getting data by your request")
                )
            }
            return
        }

        viewModel.isLoading = BehaviorRelay<Bool>(value: false)
        viewModel.title = BehaviorRelay<String>(value: data.name + " | " + data.symbol)
        viewModel.representablePrice = BehaviorRelay<String>(value: "Price: $\(data.price)")
        viewModel.marketCap = BehaviorRelay<String>(value: "Market cap: $\(data.marketCap ?? "no data")")
        
        DispatchQueue.main.async {
            self.scene?.displayRxData(response: self.viewModel)
        }
    }
    
    func presentDataFailed(error: RxDemoModel.Show.Error) {
        
        DispatchQueue.main.async {
            self.scene?.displayDataFailed(error: error)
        }
    }
    
    func clearView() {
        
        DispatchQueue.main.async {
            self.scene?.clearView()
        }
    }
    
    
    func isLoading(value: Bool) {
        
        viewModel.isLoading.accept(value)
        DispatchQueue.main.async {
            self.scene?.toogleLoadingIndicator(by: value)
        }
    }
    
}

