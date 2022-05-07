//
//  FirebaseManager.swift
//  FinalProject
//
//  Created by Bishant Tripathi on 4/17/22.
//

import Foundation
import Firebase

class FirebaseManager: NSObject {
    
    let auth: Auth
    let storage: Storage.storage
    let firestore: Firestore
    
    static let shared = FirebaseManager()
    
    override init() {
        FirebaseApp.configure()
        
        self.auth = Auth.auth()
        self.storage = Storage.storage()
        self.firestore = Firestore.firestore()
        
        super.init()
    }
}
