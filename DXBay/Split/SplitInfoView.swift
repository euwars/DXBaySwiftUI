//
//  SplitInfoView.swift
//  DXBay
//
//  Created by Farzad Nazifi on 1/12/24.
//

import SwiftUI

struct SplitInfoView: View {
  @State var small: Bool = true
  @Namespace private var animation
  
  var body: some View {
    if small {
      HStack {
        CustomText(text: "Bill amount", style: .subTitle2)
          .matchedGeometryEffect(id: "BillAmount", in: animation)
        
        Spacer()
        CustomText(text: "Set", style: .body)
      }
      .matchedGeometryEffect(id: "box", in: animation)

      .onTapGesture {
        withAnimation(.smooth) {
          small.toggle()
        }
      }
      .background(.orange)
    } else {
      VStack(alignment: .leading, spacing: 20) {
        CustomText(text: "Bill amount", style: .subTitle)
          .matchedGeometryEffect(id: "BillAmount", in: animation)

        HStack(alignment: .center) {
          Text("0 AED")
            .font(Font.system(size: 40, weight: .medium))
            .multilineTextAlignment(.center)
            .background(.orange)
        }
        .frame(maxWidth: .infinity)
      }
      .matchedGeometryEffect(id: "box", in: animation)
      .frame(maxWidth: .infinity, alignment: .leading)
      .background(.red)
      .onTapGesture {
        withAnimation(.smooth) {
          small.toggle()
        }
      }
    }
  }
}

#Preview {
  SplitInfoView()
    .safeAreaPadding()
}
