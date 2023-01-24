//
//  View.swift
//  find number
//
//  Created by Kate on 24.01.2023.
//

import UIKit
import SnapKit

class View: UIView {
    
    var randomNumber = Int.random(in: 1...50)
    var round = 1
    var points = 0
    
    init() {
        super.init(frame: .zero)
        backgroundColor = UIColor(red: 254/255, green: 250/255, blue: 224/255, alpha: 1)
        
        let mainLabel = UILabel()
        mainLabel.text = "🤖 Lets start!"
        mainLabel.font = UIFont(name: "Hoefler Text", size: 35)
        mainLabel.textColor = UIColor(red: 212/255, green: 163/255, blue: 115/255, alpha: 1)
        addSubview(mainLabel)
        mainLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(175)
        }
        
        let slider = UISlider()
        slider.minimumValue = 1
        slider.maximumValue = 50
        slider.value = 25
        slider.minimumTrackTintColor = UIColor(red: 204/255, green: 213/255, blue: 174/255, alpha: 1)
        slider.maximumTrackTintColor = UIColor(red: 233/255, green: 237/255, blue: 201/255, alpha: 1)
        slider.thumbTintColor = UIColor(red: 212/255, green: 163/255, blue: 115/255, alpha: 1)
        addSubview(slider)
        slider.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.left.equalToSuperview().inset(30)
            $0.right.equalToSuperview().inset(30)
        }
        
        let numberLabel = UILabel()
        numberLabel.text = String(randomNumber)
        numberLabel.font = UIFont(name: "Hoefler Text", size: 50)
        addSubview(numberLabel)
        numberLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(mainLabel).inset(100)
        }
        
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(red: 233/255, green: 237/255, blue: 201/255, alpha: 1)
        button.setTitle("Next round", for: .normal)
        button.titleLabel?.font = UIFont(name: "Hoefler Text", size: 20)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 10
        button.titleLabel?.textAlignment = .center
        addSubview(button)
        button.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.width.equalTo(150)
            $0.height.equalTo(70)
            $0.top.equalTo(slider).inset(200)
            
        }
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
    }
    
    @objc private func buttonTapped() {
        print("Button tapped")
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
