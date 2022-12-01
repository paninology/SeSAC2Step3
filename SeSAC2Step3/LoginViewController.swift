//
//  LoginViewController.swift
//  SeSAC2Step3
//
//  Created by yongseok lee on 2022/11/29.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var checktTextField: UITextField!
    
    var user = User(email: "", password: "", check: "")
    var validator = Validator()
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        descriptionLabel.accessibilityIdentifier =
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginButtonClicked(_ sender: UIButton) {
        
        descriptionLabel.text = "로그인 버튼을 눌렀습니다."
        
        user = User(email: emailTextField.text!, password: passwordTextField.text!, check: checktTextField.text!)
        
        if validator.isValidEmail(email: user.email) && validator.isValidPassword(password: user.password) && validator.isEqualPassword(password: user.password, check: user.check) {
            print("로그인 성공~")
        } else {
            print("로그인시패")
        }
//        if isValidEmail() && isValidPassword() && isEqualPassword() {
//            print("로그인 성공!")
//        } else {
//            print("로그인 실패!")
//        }
        
    }
    
    func isValidEmail() -> Bool {
        guard let email = emailTextField.text else { return false }
        return email.contains("@") && email.count > 8
    }
    
    func isValidPassword() -> Bool {
        guard let password = passwordTextField.text else { return false }
        return password.count >= 6 && password.count < 12
    }
    
    func isEqualPassword() ->Bool {
        guard let password = passwordTextField.text, let check = checktTextField.text else { return false }
        return password == check
    }

}

final class Validator {
    
    func isValidEmail(email: String) -> Bool {
        return email.contains("@") && email.count >= 8
    }
    
    
    func isValidPassword(password: String) -> Bool {
        return password.count >= 6 && password.count < 12
    }
    
    func isEqualPassword(password:String, check: String) -> Bool {
        password == check
    }
}

struct User {
    let email: String
    let password: String
    let check: String
}
