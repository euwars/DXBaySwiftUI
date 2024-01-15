//
//  SplitAmountView.swift
//  DXBay
//
//  Created by Farzad Nazifi on 1/12/24.
//

import SwiftUI

struct SplitAmountView: View {
  @FocusState var isFocused
  
  @State private var amount: Decimal?
  
  
  
  var body: some View {
    ZStack {
      Color.black
        .ignoresSafeArea()
      
      VStack {
        CustomText(text: "Enter bill amount", style: .subTitle2)
        
        TextField("", value: $amount, format: .currency(code: "USD"))
          .multilineTextAlignment(.center)
          .keyboardType(.numbersAndPunctuation)
          .contentTransition(.numericText())
          .font(Font.system(size: 60))
      }
    }
  }
}

extension Double {
  var str: String {
    return "\(self)"
  }
}

struct SplitAmountView_Previews: PreviewProvider {
  struct PreviewWrapper: View {
    @State private var inputText: String = ""
    @FocusState var isFocused: Bool
    
    var body: some View {
      SplitAmountView(isFocused: _isFocused)
        .safeAreaPadding()
    }
  }
  
  static var previews: some View {
    PreviewWrapper()
  }
}
