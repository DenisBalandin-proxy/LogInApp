//
//  WelcomeViewController.swift
//  LogInApp
//
//  Created by Denis on 2022/10/01.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet var welcomeLabel: UILabel!
    
    var greeting = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        welcomeLabel.text = greeting
    }
}
