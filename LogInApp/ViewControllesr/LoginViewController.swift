//
//  LoginViewController.swift
//  LogInApp
//
//  Created by Denis on 2022/10/01.
//

import UIKit

final class LoginViewController: UIViewController {
    
    @IBOutlet var userNameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    private let personData = User.getInformation()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarVC = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tabBarVC.viewControllers else { return }
        
        viewControllers.forEach { viewController in
            if let welcomeVC = viewController as? WelcomeViewController {
                welcomeVC.greeting = personData.login
            } else if let navigationVC = viewController as? UINavigationController {
                guard let informationVC = navigationVC.topViewController as? InformationViewController else { return }
                informationVC.navigationItem.title = personData.person.name + " " + personData.person.secondName
                informationVC.name = personData.person.name
                informationVC.secondName = personData.person.secondName
                informationVC.age = personData.person.age
                informationVC.country = personData.person.country
                informationVC.bio = personData.person.bio
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTF.text = ""
        passwordTF.text = ""
    }
    
    @IBAction func remindLostData(_ sender: UIButton) {
        sender.tag == 0
        ? showAlert(title: "Oops", message: "Your user name is \(personData.login)")
        : showAlert(title: "Oops", message: "Your password is \(personData.password)")
    }
    
    @IBAction func logIn() {
        guard userNameTF.text == personData.login,
              passwordTF.text == personData.password
        else {
            showAlert(
                title: "Incorrect login or password",
                message: "Enter correct data!",
                textField: passwordTF
            )
            return
        }
        performSegue(withIdentifier: "WelcomeVC", sender: nil)
    }
    
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
