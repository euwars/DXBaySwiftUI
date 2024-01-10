//
//  DXAuth.swift
//  DXBay
//
//  Created by Farzad Nazifi on 1/10/24.
//

import FirebaseAuth

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
