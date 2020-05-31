//
//  RxDemoView.swift
//  RxGenesis
//
//  Created by Roman Romanenko on 30.05.2020.
//  Copyright © 2020 RR. All rights reserved.
//

import UIKit

class RxDemoView: UIView {
    
    // MARK: Properties

    var searchTextField = TextField()
    var firstLabel = Label()
    var secondLabel = Label()
    var thirdLabel = Label()
    
    // MARK: Life cycle
    
    required init?(coder aDecoder: NSCoder) {
        fatalError(aDecoder.error.debugDescription)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        settings()
        assembleView()
    }
    
    convenience init() {
        let zeroFrame = CGRect.zero
        self.init(frame: zeroFrame)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        searchTextField.addBorder(side: .bottom, thickness: 0.5, color: .darkGray)
    }
    
    // MARK: Methods
    
    private func settings() {
        backgroundColor = AppColor.mainBackround
    }
    
    private func assembleView() {
        addSearchTextField()
        addFirstLabel()
        addSecondLabel()
        addThirdLabel()
    }
    
    // SearchTextField
    
    private func addSearchTextField() {
        searchTextField.attributedPlaceholder = NSAttributedString(
            string: "Coin short name e.g. BTC or ETH",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        )
        
        searchTextField.textColor = .systemGray
        searchTextField.textAlignment = .left
        searchTextField.keyboardType = .alphabet
        searchTextField.keyboardAppearance = .dark
        searchTextField.autocapitalizationType = .allCharacters
        searchTextField.autocorrectionType = .no
        searchTextField.font = UIFont(name: Font.primary.light, size: 18)
                
        addSubview(searchTextField)
        setSymbolTextFieldConstraints()
    }
    
    private func setSymbolTextFieldConstraints() {

        searchTextField.anchor(
            top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor,
            padding: .init(top: 0, left: 20, bottom: 0, right: 20),
            size: CGSize(width: bounds.width, height: 40)
        )
    }
    
    // firstLabel
    
    private func addFirstLabel() {
        addSubview(firstLabel)
        setFirstLabelConstraints()
    }
    
    private func setFirstLabelConstraints() {

        firstLabel.anchor(
            top: searchTextField.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor,
            padding: .init(top: 20, left: 20, bottom: 0, right: 20),
            size: CGSize(width: bounds.width, height: 40)
        )
    }
    
    // SecondLabel
    
    private func addSecondLabel() {
        addSubview(secondLabel)
        setSecondLabelConstraints()
    }
    
    private func setSecondLabelConstraints() {

        secondLabel.anchor(
            top: firstLabel.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor,
            padding: .init(top: 20, left: 20, bottom: 0, right: 20),
            size: CGSize(width: bounds.width, height: 40)
        )
    }
    
    // SecondLabel
    
    private func addThirdLabel() {
        addSubview(thirdLabel)
        setThirdLabelConstraints()
    }
    
    private func setThirdLabelConstraints() {

        thirdLabel.anchor(
            top: secondLabel.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor,
            padding: .init(top: 20, left: 20, bottom: 0, right: 20),
            size: CGSize(width: bounds.width, height: 40)
        )
    }
    
}
