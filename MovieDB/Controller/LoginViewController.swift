//
//  LoginViewController.swift
//  MovieDB
//
//  Created by Munro Azumi on 9/27/21.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var warningLabel: UILabel!
    @IBOutlet weak var emailWarningLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpTitleView()

        usernameTextField.delegate = self
        passwordTextField.delegate = self
        emailWarningLabel.isHidden = true
        warningLabel.isHidden = true
        loginButton.makeRounded()
        loginButton.backgroundColor = .cyan
    }
    
    func setUpTitleView() {
        let title: UILabel = UILabel.init()
        title.text = "THE MOVIE DB"
        title.font =  UIFont(name: "KhmerSagnamMN", size: 44)
        title.textColor = .cyan
        title.textAlignment = .center
        navigationItem.titleView = title
        navigationController?.navigationBar.barTintColor = .black
    }
    
    @IBAction func loginButtonClicked(_ sender: UIButton) {
        let st = UIStoryboard.init(name: "Main", bundle: nil)
        
        if passwordMin() && isValidEmail(usernameTextField.text ?? "") {
            let movieVC = st.instantiateViewController(identifier: "MovieListViewController")
            navigationController?.pushViewController(movieVC, animated: true)
        }
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        emailWarningLabel.isHidden = false
        return emailPred.evaluate(with: email)
    }
    
    func passwordMin() -> Bool {
        if passwordTextField.text?.count ?? 0 >= 6 {
            warningLabel.isHidden = true
            return true
        }
        warningLabel.isHidden = false
        return false
    }

}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        if textField == passwordTextField {
            loginButtonClicked(loginButton)
        }
        return false
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.addBorder()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.removeBorder()
    }
}
