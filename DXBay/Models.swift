//
//  Trx.swift
//  DXBay
//
//  Created by Farzad Nazifi on 1/8/24.
//

import FirebaseFirestore
import SwiftUI

struct Trx: Codable, Identifiable {
  var id: String?
  let amount: Int
  let person: String
  let timeStamp: Date
}

struct DXUser: Codable {
  var id: String?
  var fullName: String?
  var balance: Int?
}
