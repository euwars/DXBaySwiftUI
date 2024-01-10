//
//  GetStartedView.swift
//  DXBay
//
//  Created by Farzad Nazifi on 1/8/24.
//

import SwiftUI

struct GetStartedView: View {
  var body: some View {
    VStack {
      Spacer()
      Text("DXPay")
        .font(.largeTitle)
        .fontWeight(.bold)
      
      Text("Split and get paid")
        .font(.footnote)
      Picker(selection: /*@START_MENU_TOKEN@*/.constant(1)/*@END_MENU_TOKEN@*/, label: /*@START_MENU_TOKEN@*/Text("Picker")/*@END_MENU_TOKEN@*/) {
        /*@START_MENU_TOKEN@*/Text("1").tag(1)/*@END_MENU_TOKEN@*/
        /*@START_MENU_TOKEN@*/Text("2").tag(2)/*@END_MENU_TOKEN@*/
        /*@START_MENU_TOKEN@*/Text("2").tag(2)/*@END_MENU_TOKEN@*/

        /*@START_MENU_TOKEN@*/Text("2").tag(2)/*@END_MENU_TOKEN@*/

        /*@START_MENU_TOKEN@*/Text("2").tag(2)/*@END_MENU_TOKEN@*/
        /*@START_MENU_TOKEN@*/Text("2").tag(2)/*@END_MENU_TOKEN@*/

        /*@START_MENU_TOKEN@*/Text("2").tag(2)/*@END_MENU_TOKEN@*/

        /*@START_MENU_TOKEN@*/Text("2").tag(2)/*@END_MENU_TOKEN@*/


      }
      Spacer()
      Button("Get Started") {
        
      }
      .buttonStyle(.borderedProminent)
      .foregroundColor(.dxPrimary)
      .tint(.dxSecondary)
      .controlSize(.extraLarge)
    }
  }
}

#Preview {
  GetStartedView()
}
