//
//  DXCore.swift
//  DXBay
//
//  Created by Farzad Nazifi on 1/8/24.
//

import Foundation
import FirebaseAuth
import SwiftUI

protocol DXCoreDelegate {
  func userChanged()
}

class Account: Identifiable, Codable, ObservableObject {
  let id: String
}

class DXCore {

  @EnvironmentObject private var account: Account

  var delegate: DXCoreDelegate? = nil
  var inital = true
  var user: User? = nil {
    didSet {
      delegate?.userChanged()
    }
  }
  
  init() {
    Auth.auth().settings?.isAppVerificationDisabledForTesting = true
    _ = Auth.auth().addStateDidChangeListener { auth, user in
      if self.user != user {
        self.user = user
      } else if self.inital == true {
        self.delegate?.userChanged()
      }
    }
  }
  
  func logout() {
    do {
      try Auth.auth().signOut()
    } catch let err {
      print(err)
    }
  }
  
  var verificationId: String = ""
  func sendSMS(phoneNumber: String) {
    
  }
  
  func verify(token: String) {
    
  }
}
