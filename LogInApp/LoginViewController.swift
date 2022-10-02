//
//  LoginViewController.swift
//  LogInApp
//
//  Created by Denis on 2022/10/01.
//

import UIKit

enum WarningState: String {
    case incorrectData = "Incorrect data!"
    case forgotName = "Do you forgot your name?"
    case forgotPassword = "Do you forgot your password?"
}

class LoginViewController: UIViewController {
    
    @IBOutlet var helpButtonsStackView: UIStackView!
    
    @IBOutlet var userNameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    let accessList: [String: String] = [
        "admin": "12345",
        "guest": "111"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        
        if accessList.contains(where: { key, value -> Bool in
            key == userNameTF.text && value == passwordTF.text
        }) {
            welcomeVC.greeting = "Welcome, \(userNameTF.text ?? "")"
        } else {
            displayAlert(title: .incorrectData)
        }
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTF.text = ""
        passwordTF.text = ""
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)

        view.endEditing(true)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    
    @IBAction func rememberName() {
        displayAlert(title: .forgotName)
    }
    
    
    @IBAction func rememberPassword() {
        displayAlert(title: .forgotPassword)
    }
    
   private func displayAlert(title: WarningState) {
        
        let message: String
        
        switch title {
        case .incorrectData:
            message = "You pass wrong user name or password."
        case .forgotName:
            message = "Try to remember user name!"
        case .forgotPassword:
            message = "Try to remember password!"
        }
        
        let dialogMessage = UIAlertController(
            title: title.rawValue,
            message: message,
            preferredStyle: .alert
        )
        
        let okButton = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
            switch title {
            case .incorrectData:
                self.passwordTF.text = ""
            case .forgotName:
                self.userNameTF.backgroundColor = .red
                
                UIView.animate(withDuration: 1) {
                    self.userNameTF.backgroundColor = UIColor.systemBackground
                }
            case .forgotPassword:
                self.passwordTF.backgroundColor = .red
                
                UIView.animate(withDuration: 1) {
                    self.passwordTF.backgroundColor = UIColor.systemBackground
                }
            }
        })
        
        dialogMessage.addAction(okButton)
        self.present(dialogMessage, animated: true, completion: nil)
    }
}
