//
//  GetStartedView.swift
//  DXBay
//
//  Created by Farzad Nazifi on 1/8/24.
//

import SwiftUI

struct GetStartedView: View {
  @EnvironmentObject var router: OnboardingRouter
  
  var body: some View {
    VStack(spacing: 8) {
      Spacer()
      
      CustomText(text: "DXPay",style: .title)
      CustomText(text: "Split and get paid", style: .body)
      
      Spacer()
      
      CustomButton(label: "Get Started", sizeStyle: .fill) {
        router.navigate(to: .sendToken)
      }
    }
    .safeAreaPadding()
  }
}

#Preview {
  GetStartedView()
}
