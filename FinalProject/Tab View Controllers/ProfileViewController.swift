//
//  ProfileViewController.swift
//  FinalProject
//
//  Created by Bishant Tripathi on 4/16/22.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseFirestore
import FirebaseCore

class ProfileViewController: UIViewController {
    
    let tableInfo = ["First Name: ", "Last Name: ", "Email: ", "UID: "]
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        fetchCurrentUser()
        
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
       
    }
    
}

extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected the row.")
    }
}

extension ProfileViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath)
        cell.textLabel?.text = tableInfo[indexPath.row]
        
        let userUID = Auth.auth().currentUser?.uid
        
        Firestore.firestore().collection("users").document(userUID!).getDocument { (snapshot, error)  in
        if error != nil {
            print("Error Message")
        }
        else {
            var firstName = snapshot?.get("firstname") as? String ?? ""
            var lastName = snapshot?.get("lastname") as? String ?? ""
            var email = snapshot?.get("email") as? String ?? ""
            
            var ArrayOfUser = ["First Name: \(firstName)", "Last Name: \(lastName)", "Email: \(email)"]
            
            print(firstName)
            cell.textLabel?.text = ArrayOfUser[indexPath.row]
        }
}
        
        
        return cell
    }
}


func fetchCurrentUser(){
   
    let userUID = Auth.auth().currentUser?.uid
    var firstName: String = ""
    var lastName: String = ""
    var email: String = ""
    var ArrayOfUser: [String] = [""]
    
                Firestore.firestore().collection("users").document(userUID!).getDocument { (snapshot, error)  in
                if error != nil {
                    print("Error Message")
                }
                else {
                    firstName = snapshot?.get("firstname") as? String ?? ""
                    lastName = snapshot?.get("lastname") as? String ?? ""
                    email = snapshot?.get("email") as? String ?? ""
                    
                    ArrayOfUser = ["First Name: \(firstName)", "Last Name: \(lastName)", "Email: \(email)"]
                }
        }
    print(ArrayOfUser)
}

func getFirstName(firstname: String) -> String {
    return firstname
}

//func getLastName


