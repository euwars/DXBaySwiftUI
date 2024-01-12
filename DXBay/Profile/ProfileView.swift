//
//  ProfileView.swift
//  DXBay
//
//  Created by Farzad Nazifi on 1/12/24.
//

import SwiftUI

struct ProfileView: View {
  @EnvironmentObject var core: DXCore
  @EnvironmentObject var router: HomeRouter

  var body: some View {
    CustomButton(label: "dismiss", style: .primary) {
      router.toggleProfile()
    }
    
    CustomButton(label: "Log out", style: .destructive) {
      core.logout()
    }
  }
}

#Preview {
  ProfileView()
}
