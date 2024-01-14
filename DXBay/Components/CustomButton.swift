//
//  CustomButton.swift
//  DXBay
//
//  Created by Farzad Nazifi on 1/12/24.
//

import SwiftUI

struct CustomButton: View {
  enum CustomButtonSizeStyle {
    case fit
    case fill
  }

  enum CustomButtonStyle {
    case primary
    case outline
    case secondary
    case destructive
    
    var foregroundColor: Color {
      switch self {
      case .primary:
        Color.primaryForeground
      case .secondary:
        Color.secondaryForeground
      case .outline:
        Color.accentForeground
      case .destructive:
        Color.destructiveForeground
      }
    }
    
    var backgroundColor: Color {
      switch self {
      case .primary:
        Color.primarys
      case .secondary:
        Color.secondarys
      case .outline:
        Color.backgrounds
      case .destructive:
        Color.destructive
      }
    }
  }
  
  let label: String
  var sizeStyle: CustomButtonSizeStyle = .fit
  var style: CustomButtonStyle = .primary
  var image: String?
  var isDisabled: Bool = false
  
  let action: () -> Void
  
  var body: some View {
    Button(action: action) {
      if image != nil {
        Image(systemName: image!)
          .font(.system(size: 14, weight: .medium))
      }
      Text(label)
        .font(.system(size: 14, weight: .medium))
    }
    .frame(maxWidth: sizeStyle == .fill ? .infinity : nil)
    .padding(.horizontal, 20)
    .disabled(isDisabled)
    .opacity(isDisabled ? 0.5 : 1)
    .padding(.vertical, 12)
    .background( isDisabled ? style.backgroundColor.opacity(0.5) : style.backgroundColor)
    .foregroundColor(style.foregroundColor)
    .cornerRadius(8, antialiased: true)
    .shadow(color: style == .outline ? .black.opacity(0.05) : .clear, radius: 1, y: 2)
    .overlay(
        RoundedRectangle(cornerRadius: 8)
          .stroke(style == .outline ? .border : .clear, lineWidth: 0.5)
    )
  }
}

struct CustomButton_Previews: PreviewProvider {
  static var previews: some View {
    VStack {
      CustomButton(label: "Get started",
                   sizeStyle: .fit,
                   style: .primary,
                   image: "exclamationmark.arrow.triangle.2.circlepath",
                   action: {})
      CustomButton(label: "Copy link",
                   sizeStyle: .fit,
                   style: .secondary,
                   action: {})
      CustomButton(label: "Copy link",
                   sizeStyle: .fit,
                   style: .outline,
                   action: {})
      CustomButton(label: "Delete user",
                   sizeStyle: .fit,
                   style: .destructive,
                   action: {})
      CustomButton(label: "Get started",
                   sizeStyle: .fill,
                   style: .primary,
                   image: "exclamationmark.arrow.triangle.2.circlepath",
                   action: {})
    }
    .safeAreaPadding()
  }
}
