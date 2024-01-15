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
    .sheet(isPresented: $router.showProfile) {
      ProfileView()
    }
    .sheet(isPresented: $router.showSend) {
      ProfileView()
    }
    .sheet(isPresented: $router.showSplit) {
      SplitFlow()

    }
    .environmentObject(router)
  }
}

#Preview {
  HomeFlow()
}


