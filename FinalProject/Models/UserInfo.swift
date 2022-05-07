//
//  UserInfo.swift
//  FinalProject
//
//  Created by Bishant Tripathi on 4/17/22.
//

import Foundation
import FirebaseAuth
import Firebase
import FirebaseCore
import FirebaseFirestore

//struct UserInfo {
//
//    var id: String
//    var firstname: String
//    var lastname: String
//    var email: String
//
//}

class UserInfo {

func currentUserData() -> String{
    
  // Note: this is unsafe, please use an auth state change listener instead
  // Also, please try to avoid using force unwrap - your app will crash if the attribute is nil
  let userID : String = (Auth.auth().currentUser?.uid)!

  let userRef = Firestore.firestore().collection("users").document(userID)
      userRef.getDocument { snapshot, err in
          //
          if err == nil {
              //no error
              if let snapshot = snapshot {
                 fn =  snapshot.get("firstname") as? String ?? ""
                 ln = snapshot.get("lastname") as? String ?? ""
              }
          }else{
              
          }
        
    }
    return "nil"
}
}
