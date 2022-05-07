//
//  FirebaseManager1.swift
//  FinalProject
//
//  Created by Bishant Tripathi on 4/17/22.
//


import Foundation
import Firebase
import FirebaseStorage

class FirebaseManager1: NSObject {
    
    let auth: Auth
    let storage: Storage
    let firestore: Firestore
    
    static let shared = FirebaseManager1()
    
    override init() {
        
        self.auth = Auth.auth()
        self.storage = Storage.storage()
        self.firestore = Firestore.firestore()
        
        super.init()
    }
    
}
