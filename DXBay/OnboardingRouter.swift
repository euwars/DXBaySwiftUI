//
//  OnboardingRouter.swift
//  DXBay
//
//  Created by Farzad Nazifi on 1/10/24.
//

import SwiftUI

final class OnboardingRouter: ObservableObject {
  public enum Destination: Codable, Hashable {
    case sendToken
    case verifyToken(verificationId: String)
  }
    
  
  @Published var navPath = NavigationPath()
  
  func navigate(to destination: Destination) {
    navPath.append(destination)
  }
  
  func navigateBack() {
    navPath.removeLast()
  }
  
  func navigateToRoot() {
    navPath.removeLast(navPath.count)
  }
}

final class HomeRouter: ObservableObject {
  public enum Destination: Codable, Hashable {
    case home
    case card
    case send
    case split
  }
  
  @Published var navPath = NavigationPath()
  
  func navigate(to destination: Destination) {
    navPath.append(destination)
  }
  
  func navigateBack() {
    navPath.removeLast()
  }
  
  func navigateToRoot() {
    navPath.removeLast(navPath.count)
  }
}
