//
//  InformationViewController.swift
//  LogInApp
//
//  Created by Denis on 2022/10/05.
//

import UIKit

final class InformationViewController: UIViewController {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var secondNameLabel: UILabel!
    @IBOutlet var ageLabel: UILabel!
    @IBOutlet var countryLabel: UILabel!
    
    var name = ""
    var secondName = ""
    var age = ""
    var country = ""
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
        
        nameLabel.text = "Name: \(name)"
        secondNameLabel.text = "Second name: \(secondName)"
        ageLabel.text = "Age: \(age)"
        countryLabel.text = "Country: \(country)"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let bioVC = segue.destination as? BioViewController else { return }
        bioVC.bio = bio
    }
}
