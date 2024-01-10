//
//  BalanceView.swift
//  DXBay
//
//  Created by Farzad Nazifi on 1/10/24.
//

import SwiftUI

struct BalanceView: View {
  
  @State var amount: Int
  
  var body: some View {
    VStack(spacing: 30) {
      HStack {
        Text("Account Balance")
          .font(.headline)
        Spacer()
      }
      HStack {
        Spacer()
        Text(12332.formatted(.currency(code: "aed")))
          .fontDesign(.monospaced)
          .font(.title3)
      }
    }
  }
}

#Preview {
  BalanceView(amount: 1233)
}
