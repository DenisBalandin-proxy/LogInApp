//
//  WelcomeViewController.swift
//  LogInApp
//
//  Created by Denis on 2022/10/01.
//

import UIKit

final class WelcomeViewController: UIViewController {
    
    @IBOutlet var welcomeLabel: UILabel!
    
    var greeting = ""
    
    private let firstColor = UIColor(
        red: 210/255,
        green: 100/255,
        blue: 100/255,
        alpha: 1
    )
    private let secondColor = UIColor(
        red: 100/255,
        green: 150/255,
        blue: 200/255,
        alpha: 1
    )
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addVerticalGradient(topColor: firstColor, bottomColor: secondColor)
        welcomeLabel.text = "Welcome, \(greeting)!"
    }
}

extension UIView {
    func addVerticalGradient(topColor: UIColor, bottomColor: UIColor) {
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [topColor.cgColor, bottomColor.cgColor]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        layer.insertSublayer(gradient, at: 0)
    }
}
