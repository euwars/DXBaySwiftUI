//
//  Trx.swift
//  DXBay
//
//  Created by Farzad Nazifi on 1/8/24.
//

import Foundation
import SwiftUI

struct Trx: Codable, Identifiable {
  var id = UUID()
  let amount: Int
  let person: String
  let timeStamp: String
}
