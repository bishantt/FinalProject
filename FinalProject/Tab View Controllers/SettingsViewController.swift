//
//  SettingsViewController.swift
//  FinalProject
//
//  Created by Bishant Tripathi on 4/16/22.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseCore

class SettingsViewController: UIViewController {

    @IBOutlet var mySwitch: UISwitch!
    
    @IBOutlet var themeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        themeLabel.text = "Dark Mode"

    }
    
    
    @IBAction func switchDidChange(_ sender: UISwitch) {
        if #available(iOS 13.0, *) {
            let appDelegate = UIApplication.shared.windows.first
            
            if sender.isOn {
                appDelegate?.overrideUserInterfaceStyle = .dark
                themeLabel.text = "Light Mode"
                return
            }
            appDelegate?.overrideUserInterfaceStyle = .light
            themeLabel.text = "Dark Mode"
        }else {
            //
            print("Not supporting ios version")
        }
    }
    
    
    @IBAction func logoutButtonTapped(_ sender: UIButton) {
        let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let loginNavController = storyboard.instantiateViewController(identifier: "LoginNavigationController")

            (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(loginNavController)
            
        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
        }


    }
    
}
