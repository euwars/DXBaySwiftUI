//
//  PhoneEnterView.swift
//  DXBay
//
//  Created by Farzad Nazifi on 1/8/24.
//

import SwiftUI
import iPhoneNumberField



struct PhoneEnterView: View {
  @EnvironmentObject var router: OnboardingRouter

  @State var text = ""
  @State var isSendDisabled = true
  @State var phoneEditing = true
  @State var loading = false
  
  @State var cleanNumber = ""
  
  var body: some View {
    VStack(spacing: 40) {
      Spacer()
        .frame(height: 64)
      iPhoneNumberField("00 000 0000", text: $text, isEditing: $phoneEditing)
        .defaultRegion("AE")
      
        .multilineTextAlignment(.center)
        .flagHidden(false)
        .flagSelectable(true)
        .font(UIFont(size: 30, weight: .medium, design: .monospaced))
        .onNumberChange(perform: { number in
          guard number?.numberString != nil else {
            isSendDisabled = true
            return
          }
          cleanNumber = "+" + "\(number!.countryCode)" + "\(number!.nationalNumber)"
          isSendDisabled = false
        })
      
      if loading {
        ProgressView()
      } else {
        Button("Send Text Message") {
          loading = true
          Task {
            do {
              let id = try await DXAuth.sendSMS(phoneNumber: cleanNumber)
              router.navigate(to: .verifyToken(verificationId: id))
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
    .padding()
  }
}

#Preview {
  PhoneEnterView()
}
