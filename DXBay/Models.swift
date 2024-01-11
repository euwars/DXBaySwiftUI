//
//  Trx.swift
//  DXBay
//
//  Created by Farzad Nazifi on 1/8/24.
//

import FirebaseFirestore
import SwiftUI

enum TrxStatus: String, Codable {
  case pending
  case completed
  case partial
  case failed
  case refunded
}

enum TrxChange: String, Codable {
  case add
  case remove
}

enum TrxPaymentMethod: String, Codable {
  case applePay
  case googlePay
  case creditCard
}

struct Trx: Identifiable, Codable {
  @DocumentID var id: String?
   
  let amount: Int
  let currency: String
  let person: String
  let crated: Date
  let updated: Date
  let vaultId: String
  let status: TrxStatus
  let metaData: String
}

struct DXUser: Codable {
  var id: String?
  var fullName: String?
  var balance: Int?
}
