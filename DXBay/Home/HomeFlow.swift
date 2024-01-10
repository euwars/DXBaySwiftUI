//
//  HomeFlow.swift
//  DXBay
//
//  Created by Farzad Nazifi on 1/10/24.
//

import SwiftUI

struct HomeFlow: View {
  @ObservedObject var router = HomeRouter()
  
  var body: some View {
    NavigationStack(path: $router.navPath) {
      
      HomeListView()
        .navigationDestination(for: HomeRouter.Destination.self) { destination in

        }
    }
    .environmentObject(router)
  }
}

#Preview {
  HomeFlow()
}
