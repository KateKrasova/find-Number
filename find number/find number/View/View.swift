//
//  View.swift
//  find number
//
//  Created by Kate on 24.01.2023.
//

import UIKit
import SnapKit
import Then

class View: UIView {
    // MARK: - Views
    
    lazy var mainLabel = UILabel().then {
        $0.text = "🤖 Lets start!"
        $0.font = UIFont(name: "Hoefler Text", size: 35)
        $0.textColor = UIColor(red: 212/255, green: 163/255, blue: 115/255, alpha: 1)
    }
    
    lazy var slider = UISlider().then {
        $0.minimumValue = 1
        $0.maximumValue = 50
        $0.value = 25
        $0.minimumTrackTintColor = UIColor(red: 204/255, green: 213/255, blue: 174/255, alpha: 1)
        $0.maximumTrackTintColor = UIColor(red: 233/255, green: 237/255, blue: 201/255, alpha: 1)
        $0.thumbTintColor = UIColor(red: 212/255, green: 163/255, blue: 115/255, alpha: 1)
    }
    
    lazy var numberLabel = UILabel().then{
        $0.font = UIFont(name: "Hoefler Text", size: 35)
    }
    
    lazy var button = UIButton(type: .system).then{
        $0.backgroundColor = UIColor(red: 233/255, green: 237/255, blue: 201/255, alpha: 1)
        $0.setTitle("Press to start", for: .normal)
        $0.titleLabel?.font = UIFont(name: "Hoefler Text", size: 20)
        $0.setTitleColor(.black, for: .normal)
        $0.layer.cornerRadius = 10
        $0.titleLabel?.textAlignment = .center
    }
    
    // MARK: - LifeCycle
    
    init() {
        super.init(frame: .zero)
        confugure()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    func confugure() {
        backgroundColor = UIColor(red: 254/255, green: 250/255, blue: 224/255, alpha: 1)
        addSubview(mainLabel)
        addSubview(slider)
        addSubview(numberLabel)
        addSubview(button)
    }
    
    func setupConstraints() {
        mainLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(slider).inset(150)
        }
        
        slider.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.left.equalToSuperview().inset(30)
            $0.right.equalToSuperview().inset(30)
        }
        
        numberLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(slider).inset(70)
        }
        
        button.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.width.equalTo(150)
            $0.height.equalTo(50)
            $0.top.equalTo(slider).inset(120)
        }
    }
}
