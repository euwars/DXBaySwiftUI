//
//  CustomSplitStepProgressViewSplitStepProgressView.swift
//  DXBay
//
//  Created by Farzad Nazifi on 1/14/24.
//

import SwiftUI

struct CustomSplitStepProgressView: View {
  let stepsCount: Int
  @Binding var status: Int
  let backgroundColor: Color = .primarys
  let foregroundColor: Color = .primaryForeground
  
  var body: some View {
    HStack(spacing: 8) {
      ForEach(0..<stepsCount, id: \.self) { i in
        (i < status ? backgroundColor : foregroundColor)
          .cornerRadius(100)
      }
    }
    .onTapGesture {
      withAnimation {
        status += 1
      }
    }
    .frame(height: 12)
  }

}

struct CustomSplitStepProgressView_Previews: PreviewProvider {
  struct PreviewWrapper: View {
    @State private var status: Int = 0

    var body: some View {
      CustomSplitStepProgressView(
        stepsCount: 10, status: $status
      )
      .safeAreaPadding()
    }
  }
  
  static var previews: some View {
    PreviewWrapper()
  }
}
