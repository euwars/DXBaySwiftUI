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
        Button(action: {
          
        }, label: {
          Image(systemName: "arrow.down")
        })
        .buttonStyle(.borderedProminent)
        .controlSize(.large)
        .tint(.primary)
        Button(action: {
          
        }, label: {
          Image(systemName: "arrow.triangle.branch")
        })
        .buttonStyle(.borderedProminent)
        .controlSize(.large)
        .tint(.primary)
      }
    }
  }
}

#Preview {
  FloatingButtonView()
}
