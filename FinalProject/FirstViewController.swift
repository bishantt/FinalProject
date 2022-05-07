//
//  FirstViewController.swift
//  FinalProject
//
//  Created by Bishant Tripathi on 4/16/22.
//

import UIKit
import FirebaseAuth
import FirebaseCore
import Firebase
import FirebaseFirestore


class FirstViewController: UIViewController {

    @IBOutlet var signUpButton: UIButton!
    @IBOutlet var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if Auth.auth().currentUser != nil {
            transitionToHomeScreen()
        } else {
            setupElements()
        }

    }
    
    func setupElements() {
        Utilities.styleFilledButton(signUpButton)
        Utilities.styleFilledButton(loginButton)
    }

    @IBAction func SignUpButtonTapped(_ sender: UIButton) {
    }
    
    
    @IBAction func LoginButtonTapped(_ sender: UIButton) {
    }
    
    func transitionToHomeScreen(){
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainTabBarController = storyboard.instantiateViewController(identifier: "MainTabBarController")
            
            (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
    }
}
