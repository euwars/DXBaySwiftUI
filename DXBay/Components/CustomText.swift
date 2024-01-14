//
//  CustomText.swift
//  DXBay
//
//  Created by Farzad Nazifi on 1/12/24.
//

import SwiftUI

struct CustomText: View {
  let text: String
  var style: Style = .body
  
  enum Style {
    case largeTitle
    case title
    case subTitle
    case subTitle2
    case bodyNormal
    case body
    
    var font: Font {
      switch self {
      case .largeTitle:
        Font.system(size: 30, weight: .semibold)
      case .title:
        Font.system(size: 24, weight: .semibold)
      case .subTitle:
        Font.system(size: 16, weight: .medium)
      case .subTitle2:
        Font.system(size: 14, weight: .medium)
      case .body:
        Font.system(size: 14, weight: .regular)
      case .bodyNormal:
        Font.system(size: 14, weight: .medium)
      }
    }
    
    var color: Color {
      switch self {
      case .largeTitle:
        Color.cardForeground
      case .title:
        Color.cardForeground
      case .subTitle:
        Color.cardForeground
      case .subTitle2:
        Color.cardForeground
      case .body:
        Color.mutedForeground
      case .bodyNormal:
        Color.cardForeground
      }
    }
  }
  
  var body: some View {
    Text(text)
      .font(style.font)
      .foregroundStyle(style.color)
  }
}

#Preview {
  VStack(alignment: .center, spacing: 8) {
    CustomText(text: "Create an account", style: .title)
    CustomText(text: "Enter your email below to create your account", style: .body)
    CustomText(text: "Hellow", style: .subTitle)
    CustomText(text: "Hellow", style: .body)
  }
  .safeAreaPadding()
}
