//
//  ViewController.swift
//  find number
//
//  Created by Kate on 24.01.2023.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Private Props
    
    let moduleView = View()
    
    var randomNumber = Int.random(in: 1...50)
    var round = 0
    var points = 0
    
    // MARK: - LifeCycle

    override func loadView() {
        view = moduleView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        moduleView.button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }

    @objc func buttonTapped() {
        moduleView.button.setTitle("Next round", for: .normal)
        let sliderNum = Int(moduleView.slider.value.rounded())
        
        if sliderNum > randomNumber {
            points += 50 - randomNumber + sliderNum
        } else if sliderNum < randomNumber {
            points += 50 - randomNumber + sliderNum
        } else {
            points += 50
        }
        
        if round == 4 {
            moduleView.button.setTitle("Get result!", for: .normal)
        }
        if round == 5 {
            switch points {
            case 0...50 : moduleView.backgroundColor = .brown
            case 50...150 : moduleView.backgroundColor = .blue
            case 150... : moduleView.backgroundColor = .green
            default: break
            }
            
            let alert = UIAlertController(title: "Финал!", message: "Вы заработали \(points) очков", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Играть еще раз", style: .default, handler: { _ in
                self.moduleView.backgroundColor = UIColor(red: 254/255, green: 250/255, blue: 224/255, alpha: 1)
            }))
            present(alert, animated: true)
            round = 0
            points = 0
            moduleView.button.setTitle("Next round", for: .normal)
        } else {
            round += 1
        }
        
        randomNumber = Int.random(in: 1...50)
        moduleView.numberLabel.text = String(randomNumber)
        moduleView.mainLabel.text = "\(round) / 5"
    }
}

