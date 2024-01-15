//
//  SplitFlow.swift
//  DXBay
//
//  Created by Farzad Nazifi on 1/12/24.
//

import SwiftUI

struct SplitFlow: View {
  @ObservedObject var router = SplitRouter()
  
  var body: some View {
    NavigationStack(path: $router.navPath) {
      
      SplitAmountView()
        .navigationDestination(for: HomeRouter.Destination.self) { destination in
          
        }
    }
    .environmentObject(router)
  }
}

#Preview {
  SplitFlow()
}
