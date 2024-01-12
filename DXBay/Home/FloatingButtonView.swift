//
//  FloatingButtonView.swift
//  DXBay
//
//  Created by Farzad Nazifi on 1/10/24.
//

import SwiftUI

struct FloatingButtonView: View {
  var body: some View {
    VStack {
      Spacer()
      HStack {
        CustomButton(label: "Gimme", image: "arrow.down") {
          
        }
      
        CustomButton(label: "Split", image: "arrow.triangle.branch") {
          
        }
      }
    }
  }
}

#Preview {
  FloatingButtonView()
}
