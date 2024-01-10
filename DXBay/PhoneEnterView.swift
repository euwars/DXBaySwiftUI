//
//  PhoneEnterView.swift
//  DXBay
//
//  Created by Farzad Nazifi on 1/8/24.
//

import SwiftUI
import iPhoneNumberField

struct PhoneEnterView: View {
  @State var text = ""
  @State var isSendDisabled = true
  @State var phoneEditing = false
  
  var body: some View {
    VStack(spacing: 40) {
      Spacer()
        .frame(height: 64)
      iPhoneNumberField("00 000 0000", text: $text, isEditing: $phoneEditing)
        .defaultRegion("AE")
        .flagHidden(false)
        .flagSelectable(true)
        .font(UIFont(size: 30, weight: .medium, design: .monospaced))
        .onNumberChange(perform: { number in
          guard number?.numberString != nil else {
            isSendDisabled = true
            return
          }
          isSendDisabled = false
        })
      
      Button("Send Text Message") {
        
      }
      .disabled(isSendDisabled)
      .buttonStyle(.borderedProminent)
      .foregroundColor(.dxPrimary)
      .tint(.dxSecondary)
      .controlSize(.extraLarge)
      Spacer()
    }
    .padding()
  }
}

#Preview {
  PhoneEnterView()
}
