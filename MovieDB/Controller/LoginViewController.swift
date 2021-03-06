//
//  LoginViewController.swift
//  MovieDB
//
//  Created by Munro Azumi on 9/27/21.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginImgView: UIImageView!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailWarningLabel: UILabel!
    @IBOutlet weak var passwordWarningLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpTitleView()
        loginImgView.image = UIImage.init(named: "MovieDBIcon")
        loginImgView.makeRounded()
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        emailWarningLabel.isHidden = true
        passwordWarningLabel.isHidden = true
        loginButton.makeRounded()
        loginButton.backgroundColor = UIColor(rgb: 0x68FBCF)
    }
    
    func setUpTitleView() {
        let title: UILabel = UILabel.init()
        title.text = "THE MOVIE DB"
        title.font =  UIFont(name: "KhmerSagnamMN", size: 44)
        title.textColor = UIColor(rgb: 0x68FBCF)
        title.textAlignment = .center
        navigationItem.titleView = title
    }
    
    @IBAction func loginButtonClicked(_ sender: UIButton) {
        let st = UIStoryboard.init(name: "Main", bundle: nil)
        
        if passwordMin() && isValidEmail(usernameTextField.text ?? "") {
            emailWarningLabel.isHidden = true
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
            passwordWarningLabel.isHidden = true
            return true
        }
        passwordWarningLabel.isHidden = false
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
