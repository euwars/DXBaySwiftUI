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

struct DXUser {
  let fullName: String
  let balance: String

  //  var authUser: User
  
}

class DXCore: ObservableObject {
  
  @Published var userID: String?
  var ref: DatabaseReference!

  init() {
    Auth.auth().settings?.isAppVerificationDisabledForTesting = true
    _ = Auth.auth().addStateDidChangeListener { auth, user in
      print("User", auth, user)
      if self.userID != user?.uid {
        self.userID = user?.uid
      }
    }
  }
  

  
  func listenUser() {

    let userID = Auth.auth().currentUser?.uid
    let db = Firestore.firestore()
    
    
    db.collection("users").document(userID!)
      .addSnapshotListener { documentSnapshot, error in
        guard let document = documentSnapshot else {
          print("Error fetching document: \(error!)")
          return
        }
        guard let data = document.data() else {
          print("Document data was empty.")
          return
        }
        print("Current data: \(data)")
      }
  }
  
  func logout() {
    do {
      try Auth.auth().signOut()
      self.userID = nil
    } catch let err {
      print(err)
    }
  }
  
  var verificationId: String = ""
  func sendSMS(phoneNumber: String) async throws -> String {
    try await withCheckedThrowingContinuation { continuation in
      PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) { verificationId, error in
        if let verificationId = verificationId {
          self.verificationId = verificationId
        } else if let error {
          continuation.resume(throwing: error)
        } else {
          continuation.resume(throwing: AuthError.sendSMSUnkown)
        }
      }
    }
  }
  
  func verify(token: String) async throws -> AuthDataResult {
    try await withCheckedThrowingContinuation { continuation in
      
      let credential = PhoneAuthProvider.provider().credential(
        withVerificationID: verificationId,
        verificationCode: token
      )
      
      Auth.auth().signIn(with: credential) { authResult, error in
        if let authResult = authResult {
          continuation.resume(returning: authResult)
        } else if let error {
          continuation.resume(throwing: error)
        } else {
          continuation.resume(throwing: AuthError.verifyTokenUnkown)
        }
        
      }
    }
  }
}

struct DXAuth {
  static func sendSMS(phoneNumber: String) async throws -> String {
    try await withCheckedThrowingContinuation { continuation in
      PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) { verificationId, error in
        if let verificationId = verificationId {
          continuation.resume(returning: verificationId)
        } else if let error {
          continuation.resume(throwing: error)
        } else {
          continuation.resume(throwing: AuthError.sendSMSUnkown)
        }
      }
    }
  }
  
  static func verify(verificationId: String, token: String) async throws -> AuthDataResult {
    try await withCheckedThrowingContinuation { continuation in
      
      let credential = PhoneAuthProvider.provider().credential(
        withVerificationID: verificationId,
        verificationCode: token
      )
      
      Auth.auth().signIn(with: credential) { authResult, error in
        if let authResult = authResult {
          continuation.resume(returning: authResult)
        } else if let error {
          continuation.resume(throwing: error)
        } else {
          continuation.resume(throwing: AuthError.verifyTokenUnkown)
        }
        
      }
    }
  }
}
