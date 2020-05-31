//
//  RxDemoConfigurator.swift
//  RxGenesis
//
//  Created by Roman Romanenko on 30.05.2020.
//  Copyright © 2020 RR. All rights reserved.
//

import Foundation

final class RxDemoConfigurator {
    
    // MARK: Configure

    static func configure(_ scene: RxDemoScene) {
        let interactor = RxDemoInteractor()
        let presenter = RxDemoPresenter()
        let router = RxDemoRouter()
        scene.interactor = interactor
        scene.router = router
        interactor.presenter = presenter
        presenter.scene = scene
        router.scene = scene
        router.dataStore = interactor
    }
    
}
