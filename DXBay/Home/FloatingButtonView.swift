//
//  FloatingButtonView.swift
//  DXBay
//
//  Created by Farzad Nazifi on 1/10/24.
//

import SwiftUI

struct FloatingButtonView: View {
  @EnvironmentObject var router: HomeRouter

  var body: some View {
    VStack {
      Spacer()
      HStack {
        CustomButton(label: "Gimme", image: "arrow.down") {
          router.toggleSend()
        }
      
        CustomButton(label: "Split", image: "arrow.triangle.branch") {
          router.toggleSplit()
        }
      }
    }
  }
}

#Preview {
  FloatingButtonView()
}
