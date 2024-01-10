//
//  DXCore.swift
//  DXBay
//
//  Created by Farzad Nazifi on 1/8/24.
//

import Foundation
import FirebaseAuth
import SwiftUI
import FirebaseFirestoreSwift
import Firebase
import FirebaseDatabase

enum AuthError: Error {
  case sendSMSUnkown
  case verifyTokenUnkown
}

class DXCore: ObservableObject {
  
  @Published var userID: String?
  var ref: DatabaseReference!
  @Published var user: DXUser?
  
  init() {
    Auth.auth().settings?.isAppVerificationDisabledForTesting = true
    _ = Auth.auth().addStateDidChangeListener { auth, user in
      if self.userID != user?.uid {
        self.userID = user?.uid
        print(self.userID)
        self.listenUser()
      }
    }
  }
  
  var userListenRegistraion: ListenerRegistration?
  func listenUser() {
    guard let userID = Auth.auth().currentUser?.uid else {
      return
    }
    
    let db = Firestore.firestore()
    
    userListenRegistraion = db.collection("users").document(userID)
      .addSnapshotListener { documentSnapshot, error in
        guard let document = documentSnapshot else {
          print("Error fetching document: \(error!)")
          return
        }
        guard let data = document.data() else {
          print("Document data was empty.")
          return
        }
        
        self.user = try! document.data(as: DXUser.self)
        print(self.user)
        
        
        print("Current data: \(data)")
      }
  }
  
  var trxListenRegistraion: ListenerRegistration?
  func listenTransactions() {
    guard let userID = Auth.auth().currentUser?.uid else {
      return
    }
    
    let db = Firestore.firestore()
    let transactions = db.collection("transactions")
    
    let filter = transactions.whereFilter(.)
    
    
    trxListenRegistraion = db.collection("transactions").whereFilter(Filter.orFilter([
    ])


  }
  
  func logout() {
    do {
      try Auth.auth().signOut()
      self.userID = nil
    } catch let err {
      print(err)
    }
  }
}
