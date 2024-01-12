//
//  BalanceView.swift
//  DXBay
//
//  Created by Farzad Nazifi on 1/10/24.
//

import SwiftUI

struct BalanceView: View {
  
  let amount: Int?
  
  var body: some View {
    VStack(spacing: 30) {
      HStack {
        CustomText(text: "Account balance", style: .subTitle2)
        Spacer()
      }
      HStack {
        Spacer()
        CustomText(text: amount?.formatted(.currency(code: "AED")) ?? "--", style: .title)
      }
    }
  }
}

#Preview {
  BalanceView(amount: 1233)
}
