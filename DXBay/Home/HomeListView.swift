//
//  HomeListView.swift
//  DXBay
//
//  Created by Farzad Nazifi on 1/8/24.
//

import SwiftUI

struct HomeListView: View {
  @EnvironmentObject var core: DXCore

  let transactions: [Trx] = [
    .init(amount: 130, person: "Tahsin", timeStamp: "2s ago"),
    .init(amount: 532, person: "Ali", timeStamp: "Yesterday"),
    .init(amount: 423, person: "Cindy", timeStamp: "Yesterday"),
    .init(amount: 9032, person: "Esteban", timeStamp: "Last month")
  ]
  
  var body: some View {
    NavigationStack {
      ZStack {

        List {
          Section {
            BalanceView(amount: core.user?.balance ?? 0)
          }
          
          Section("Transactions") {
            
            ForEach(transactions) { trx in
              Text("\(trx.person) paid you \(trx.amount)")
            }
          }
        }

        //        }
        .toolbar {
          ToolbarItem {
            Button(action: {
              // Profile click
            }, label: {
              Image(systemName: "person.crop.circle.fill")
                .tint(.primary)
            })
          }
        }
        .navigationTitle("DXBay")
        
        FloatingButtonView()
      }
    }
  }
}

#Preview {
  HomeListView()
}
