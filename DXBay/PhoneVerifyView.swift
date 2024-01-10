//
//  PhoneVerifyView.swift
//  DXBay
//
//  Created by Farzad Nazifi on 1/8/24.
//

import SwiftUI

struct PhoneVerifyView: View {
  let verificationId: String
  let phoneNumber: String
  @State var text = ""
  @State var isSendDisabled = true
  @State var loading = false
  @FocusState private var isEditing: Bool
  @EnvironmentObject var core: DXCore

  var body: some View {
    if loading {
      ProgressView()
    } else {
      VStack(spacing: 40) {
        Spacer()
          .frame(height: 64)
        SecureField("token", text: $text.max(6))
          .multilineTextAlignment(.center)
          .focused($isEditing)
          .textContentType(.oneTimeCode)
          .onChange(of: text, {
            isSendDisabled = text.count < 6
          })
          .font(.largeTitle)
        if loading {
          ProgressView()
        } else {
          Button("Verify") {
            Task {
              do {
                try await DXAuth.verify(verificationId: verificationId, token: text)
                loading = false
              } catch let err {
                loading = false
                print(err)
              }
            }
          }
          .disabled(isSendDisabled)
          .buttonStyle(.borderedProminent)
          .foregroundColor(.dxPrimary)
          .tint(.dxSecondary)
          .controlSize(.extraLarge)
        }
        Spacer()
      }
      .onAppear {
        isEditing = true
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
  PhoneVerifyView(verificationId: "", phoneNumber: "")
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
