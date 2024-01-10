//
//  OnboardingFlow.swift
//  DXBay
//
//  Created by Farzad Nazifi on 1/10/24.
//

import SwiftUI

struct OnboardingFlow: View {
  @ObservedObject var router = OnboardingRouter()
  
  var body: some View {
    NavigationStack(path: $router.navPath) {
      GetStartedView()
        .navigationDestination(for: OnboardingRouter.Destination.self) { destination in
          switch destination {
          case .sendToken:
            PhoneEnterView()
          case .verifyToken(let verificationId):
            PhoneVerifyView(verificationId: verificationId, phoneNumber: "")
          }
        }
    }
    .environmentObject(router)
  }
}

#Preview {
  OnboardingFlow()
}
