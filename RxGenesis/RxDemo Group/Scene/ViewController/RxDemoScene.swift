//
//  ViewController.swift
//  RxGenesis
//
//  Created by Roman Romanenko on 30.05.2020.
//  Copyright © 2020 RR. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class RxDemoScene: UIViewController {
    
    // MARK: View dependencies
    
    var interactor: RxDemoBusinessLogic?
    var router: (RxDemoRoutingLogic & RxDemoDataPassing)?
    
    // MARK: Variables
        
    private var disposeBag = DisposeBag()
    private let _view = RxDemoView(frame: UIScreen.main.bounds)

    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemPink
        attachViewToSafeArea(_view)
        bindSearchTextField()
    }
    
    // MARK: Methods
    
    private func bindSearchTextField() {
        _ = _view.searchTextField.rx.text.map { $0 ?? "" }.bind(to: interactor!.inputValue)
    }

}

// MARK: - RxDemoInterface

extension RxDemoScene: RxDemoInterface {
    
    func toogleLoadingIndicator(by value: Bool) {
        _view.searchTextField.ai.isHidden = !value
    }

    func displayDataFailed(error: RxDemoModel.Show.Error) {
        super.showAlert(message: error.reason)
    }
    
    func clearView() {
        _view.searchTextField.text = nil
        _view.firstLabel.text = nil
        _view.secondLabel.text = nil
        _view.thirdLabel.text = nil
    }
    
    func displayRxData(response: RxDemoModel.Show.ViewModel) {
        
        let viewModel = response.isLoading
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [unowned self] isLoading in
            
            guard !isLoading else { return }
        
            self._view.firstLabel.text = response.title.value
            self._view.secondLabel.text = response.representablePrice.value
            self._view.thirdLabel.text = response.marketCap.value
            
        })
    
        viewModel.disposed(by: disposeBag)
    }
    
}
