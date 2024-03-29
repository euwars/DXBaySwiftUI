//
//  HomeRouter.swift
//  DXBay
//
//  Created by Farzad Nazifi on 1/10/24.
//

import SwiftUI

final class HomeRouter: ObservableObject {
  public enum Destination: Codable, Hashable {
    case home
    case card
    case send
    case split
  }
    
  @Published var showProfile: Bool = false
  
  @Published var showSplit: Bool = false
  @Published var showSend: Bool = false
  
  @Published var navPath = NavigationPath()
  
  func navigate(to destination: Destination) {
    navPath.append(destination)
  }
  
  func navigateBack() {
    navPath.removeLast()
  }
  
  func toggleProfile() {
    showProfile.toggle()
  }
  
  func toggleSend() {
    showSend.toggle()
  }
  
  func toggleSplit() {
    showSplit.toggle()
  }
  
  func navigateToRoot() {
    navPath.removeLast(navPath.count)
  }
}
