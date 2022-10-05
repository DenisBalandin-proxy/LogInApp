//
//  BioViewController.swift
//  LogInApp
//
//  Created by Denis on 2022/10/05.
//

import UIKit

class BioViewController: UIViewController {
    
    @IBOutlet var bioLabel: UILabel!
    
    var bio = ""
    
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
        bioLabel.text = bio
        
    }
}
