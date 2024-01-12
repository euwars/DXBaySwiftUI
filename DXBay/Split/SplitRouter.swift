//
//  SplitRouter.swift
//  DXBay
//
//  Created by Farzad Nazifi on 1/12/24.
//

import SwiftUI

final class SplitRouter: ObservableObject {
  public enum Destination: Codable, Hashable {
    case amount(amount: Int)
    case people
    case portions
    case creating
    case linkPresent(link: String)
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
