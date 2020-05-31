//
//  RxDemoRouter.swift
//  RxGenesis
//
//  Created by Roman Romanenko on 30.05.2020.
//  Copyright © 2020 RR. All rights reserved.
//

import UIKit

protocol RxDemoRoutingLogic {
    func routeToNextScene()
}

protocol RxDemoDataPassing {
    var dataStore: RxDemoShareDataProtocol? { get }
}

// MARK: Router

final class RxDemoRouter: RxDemoRoutingLogic, RxDemoDataPassing {
    
    // MARK: Properties
    
    weak var scene: RxDemoScene?
    
    // MARK: Dependencies
    
    var dataStore: RxDemoShareDataProtocol?
    
    // MARK: Routing

    func routeToNextScene() {
        /*let vc = SomeNextScene()
        SomeNextSceneConfigurator.configure(vc)
        
        // Passing data
        var destinationDataShare = vc.router!.dataStore!
        passDataToSomeNextScene(source: dataStore!, destination: &destinationDataShare)

        scene?.show(vc, sender: .none)*/
    }
    
    // MARK: Passing data

    /*
    func passDataToSomeNextScene(source: RxDemoDataStore, destination: inout SomeNextScene) {
        guard let passingData = source.someData else { return }
        destination.receivingData = passingData
    }*/

}


