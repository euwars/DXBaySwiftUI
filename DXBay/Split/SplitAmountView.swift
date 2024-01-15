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
      Color.red
        .ignoresSafeArea()
      
      VStack {
        CustomText(text: "Enter bill amount", style: .subTitle2)
        
//        Text(amount, format: .currency(code: "GBP"))
//        TextField("Amount", value: $amount, format: .number.precision(.fractionLength(2)))
//            .keyboardType(.decimalPad)
//        
        TextField("Amount", value: $amount, format: .number.precision(.fractionLength(3)))
          .focused($isFocused)
          .multilineTextAlignment(.center)
          .keyboardType(.decimalPad)
          .font(Font.system(size: 60))
          .onAppear {
            self.isFocused = true

//            DispatchQueue.main.asyncAfter(deadline: .now() + 0.75) {
//              self.isFocused = true
//            }
          }
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
//    @State private var inputText: String = ""
//    @FocusState var isFocused: Bool
    
    var body: some View {
      SplitAmountView()
        .safeAreaPadding()
    }
  }
  
  static var previews: some View {
    PreviewWrapper()
  }
}
