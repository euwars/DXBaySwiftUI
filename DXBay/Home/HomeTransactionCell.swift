//
//  HomeTransactionCell.swift
//  DXBay
//
//  Created by Farzad Nazifi on 1/12/24.
//

import SwiftUI

struct HomeTransactionCell: View {
  
  
  var body: some View {
    HStack(alignment: .center, spacing: 10) {
      CustomAvatar()

      VStack(alignment: .leading, spacing: 2) {
        CustomText(text: "Olivia Martin", style: .subTitle2)
        CustomText(text: "m@example.com", style: .body)
      }
      
      Spacer()
      
      CustomText(text: "+30,322.00", style: .subTitle2)
    }
//    .safeAreaPadding()
    .frame(maxWidth: .infinity, alignment: .leading)
    
  }
}

#Preview {
  HomeTransactionCell()
}
