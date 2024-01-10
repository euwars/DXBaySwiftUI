//
//  PhoneVerifyView.swift
//  DXBay
//
//  Created by Farzad Nazifi on 1/8/24.
//

import SwiftUI

struct PhoneVerifyView: View {
  @State var text = ""
  @State var isSendDisabled = true
  @State var isVerifying = false
  
  var body: some View {
    if isVerifying {
      ProgressView()
    } else {
      VStack(spacing: 40) {
        Spacer()
          .frame(height: 64)
        TextField("Placeholder", text: $text.max(6))
          .onChange(of: text, {
            isSendDisabled = text.count < 5
          })
          .font(.largeTitle)
        Button("Verify") {
          isVerifying = true
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
  
  func limitText(_ upper: Int) {
    if text.count > upper {
      text = String(text.prefix(upper))
    }
  }
}

#Preview {
  PhoneVerifyView()
}

extension Binding where Value == String {
  func max(_ limit: Int) -> Self {
    if self.wrappedValue.count > limit {
      DispatchQueue.main.async {
        self.wrappedValue = String(self.wrappedValue.dropLast())
      }
    }
    return self
  }
}
