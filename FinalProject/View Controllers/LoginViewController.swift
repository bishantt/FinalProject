//
//  LoginViewController.swift
//  FinalProject
//
//  Created by Bishant Tripathi on 4/15/22.
//


import UIKit
import Firebase
import FirebaseAuth
import FirebaseFirestore
import FirebaseCore

class LoginViewController: UIViewController {

    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var alreadyHaveAccountButton: UIButton!
    @IBOutlet var errorLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupElements()

        // Do any additional setup after loading the view.
    }
    
    func setupElements() {
        errorLabel.alpha = 0
        
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(loginButton)
        Utilities.styleFilledButton(alreadyHaveAccountButton)
    }
    
    @IBAction func loginTapped(_ sender: UIButton) {
        //Validate text fields
        
        
        //create cleaned versions of the text field
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        
        
        
        //Signing in the User
        FirebaseManager1.shared.auth.signIn(withEmail: email, password: password) { result, error in
            if error != nil {
                self.errorLabel.text = error!.localizedDescription
                self.errorLabel.alpha = 1
            } else {
                
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let mainTabBarController = storyboard.instantiateViewController(identifier: "MainTabBarController")
            
                    (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
                
            }
        }
    }
    
    @IBAction func registerTapped(_ sender: UIButton) {
    }
    
    
   
    
}

