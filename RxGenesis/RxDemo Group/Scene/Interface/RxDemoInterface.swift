//
//  RxDemoInterface.swift
//  RxGenesis
//
//  Created by Roman Romanenko on 30.05.2020.
//  Copyright © 2020 RR. All rights reserved.
//

protocol RxDemoInterface: AnyObject {
    func toogleLoadingIndicator(by value: Bool)
    func displayRxData(response: RxDemoModel.Show.ViewModel)
    func displayDataFailed(error: RxDemoModel.Show.Error)
    func clearView()
}
