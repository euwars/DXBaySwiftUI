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
    NavigationStack {
      VStack {
        Spacer()
        Text("DXPay")
          .font(.largeTitle)
          .fontWeight(.bold)
        
        Text("Split and get paid")
          .font(.footnote)
        Spacer()
        Button("Get Started") {
          router.navigate(to: .sendToken)
        }
        .buttonStyle(.borderedProminent)
        .foregroundColor(.dxPrimary)
        .tint(.dxSecondary)
        .controlSize(.extraLarge)
      }
    }
  }
}

#Preview {
  GetStartedView()
}
