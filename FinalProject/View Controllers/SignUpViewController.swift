//
//  SignUpViewController.swift
//  FinalProject
//
//  Created by Bishant Tripathi on 4/15/22.
//

import UIKit
import FirebaseAuth
import FirebaseCore
import Firebase
import FirebaseFirestore




class SignUpViewController: UIViewController {

    @IBOutlet var firstNameTextField: UITextField!
    @IBOutlet var lastNameTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var signUpButton: UIButton!
    @IBOutlet var alreadyHaveAccount: UIButton!
    @IBOutlet var errotLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
            setupElements()
        
    }
    
    func setupElements() {
        errotLabel.alpha = 0
        
        Utilities.styleTextField(firstNameTextField)
        Utilities.styleTextField(lastNameTextField)
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(signUpButton)
        Utilities.styleFilledButton(alreadyHaveAccount)
        
    }
    
    func validateFields() -> String? {
        
        //check if all fields are filled in
        if firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
            return "Please fill in all the fields."
        }
        
        let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isPasswordValid(cleanedPassword) == false {
            //Password not strong
            return "Please make sure your password is at least 8 characters, contains a speacial character and a number."
            
        }
        return nil
    }
    
    @IBAction func signUpButtonTapped(_ sender: UIButton) {
        
        //Validate the fields
        let error = validateFields()
        
        if error != nil {
            //something wrong with the fields.
            showError(error!)
        }
        else {
            // Creat cleaned version of the data
            let firstName = firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastName = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            //Create the user
            Auth.auth().createUser(withEmail: email, password: password) { result, err in
                
                //check for errors
                if err != nil {
                    //There was an error
                    self.showError("Error creating user")
                } else {
                    //User was created succesfully
                    let userUID = Auth.auth().currentUser?.uid
                    let data = ["firstname":firstName, "lastname":lastName,"displayName":firstName + " " + lastName, "email":email,"uid":result!.user.uid]
                
//                    FirebaseManager1.shared.firestore.collection("users").addDocument(data: ["firstname":firstName, "lastname":lastName,"displayName":firstName + " " + lastName, "email":email,"uid":result!.user.uid])
                    
                    Firestore.firestore().collection("users").document(userUID!).setData(data) { (error) in
                        if error != nil {
                            self.showError("User data couldn't be saved in database.")
                        }
                    }
                    //Transition to the HomeScreen
                    
                    self.transitionToHomeScreen()
                }
            }
            
        }
        
    }
    
    func transitionToHomeScreen(){
//        let homeViewController = storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.homeViewController) as? HomeViewController
//        view.window?.rootViewController = homeViewController
//        view.window?.makeKeyAndVisible()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainTabBarController = storyboard.instantiateViewController(identifier: "MainTabBarController")
            
            // This is to get the SceneDelegate object from your view controller
            // then call the change root view controller function to change to main tab bar
            (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
    }
    
    func showError(_ message: String) {
        errotLabel.text = message
        errotLabel.alpha = 1
    }
    
    
    @IBAction func loginTapped(_ sender: UIButton) {
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }

}
