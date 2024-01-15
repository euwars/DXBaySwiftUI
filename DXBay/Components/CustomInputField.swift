//
//  CustomInputField.swift
//  DXBay
//
//  Created by Farzad Nazifi on 1/12/24.
//

import SwiftUI

struct CustomInputField: View {
  @Binding var text: String
  @FocusState.Binding var isFocused: Bool

  var label: String
  var iconName: String?
  var isDisabled: Bool = false
  var placeholder: String = ""
  var contentType: UITextContentType = .telephoneNumber
  
  var body: some View {
    TextField(label, text: $text)
    .textContentType(contentType)
    .placeholder(when: text.isEmpty) {
        Text(placeholder)
        .foregroundColor(.input)
    }
    .disabled(isDisabled)
    .focused($isFocused)
    .background(.backgrounds)
    .cornerRadius(8)
    .foregroundColor(.primary)
    .padding(
      EdgeInsets(top: 8, leading: 14, bottom: 8, trailing: 14)
    )
//    .overlay(
//      RoundedRectangle(cornerRadius: 8)
//        .stroke(isFocused  == true ? .primaryForeground : .border,
//                lineWidth: isFocused  == true ? 2 : 0.5)
//    )
  }
}

struct CustomInputField_Previews: PreviewProvider {
  struct PreviewWrapper: View {
    @State private var inputText: String = ""
    @FocusState var isFocused: Bool

    var body: some View {
      CustomInputField(
        text: $inputText,
        isFocused: $isFocused,
        label: "Email",
        iconName: "envelope",
        placeholder: "Email"
      )
      .safeAreaPadding()
    }
  }
  
  static var previews: some View {
    PreviewWrapper()
  }
}
