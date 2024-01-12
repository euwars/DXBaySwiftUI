//
//  View.swift
//  DXBay
//
//  Created by Farzad Nazifi on 1/12/24.
//

import SwiftUI


extension View {
  func dropShadow() -> some View {
    self.shadow(color: .black.opacity(0.05), radius: 1, y: 2)
  }
  
  // Credits to https://stackoverflow.com/a/57715771
  func placeholder<Content: View>(
    when shouldShow: Bool,
    alignment: Alignment = .leading,
    @ViewBuilder placeholder: () -> Content
  ) -> some View {
    ZStack(alignment: alignment) {
      placeholder().opacity(shouldShow ? 1 : 0)
      self
    }
  }
}
