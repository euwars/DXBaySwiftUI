//
//  HomeListView.swift
//  DXBay
//
//  Created by Farzad Nazifi on 1/8/24.
//

import SwiftUI

struct HomeListView: View {
  @EnvironmentObject var router: HomeRouter
  @EnvironmentObject var core: DXCore
  
  //  let transactions: [Trx] = [
  //    .init(amount: 130, person: "Tahsin", timeStamp: "2s ago"),
  //    .init(amount: 532, person: "Ali", timeStamp: "Yesterday"),
  //    .init(amount: 423, person: "Cindy", timeStamp: "Yesterday"),
  //    .init(amount: 9032, person: "Esteban", timeStamp: "Last month")
  //  ]
  
  var body: some View {
    NavigationStack {
      ZStack {
        
        List {
          Section {
            BalanceView(amount: 12)
          }
          
          Section {
            CustomText(text: "Recent transactions", style: .subTitle2)
            
              .listRowSeparator(.hidden)
            
            HomeTransactionCell()
              .listRowSeparator(.hidden)
            HomeTransactionCell()
              .listRowSeparator(.hidden)
            HomeTransactionCell()
              .listRowSeparator(.hidden)
            HomeTransactionCell()
              .listRowSeparator(.hidden)
            HomeTransactionCell()
              .listRowSeparator(.hidden)
            HomeTransactionCell()
              .listRowSeparator(.hidden)
            HomeTransactionCell()
              .listRowSeparator(.hidden)
            HomeTransactionCell()
              .listRowSeparator(.hidden)
            HomeTransactionCell()
              .listRowSeparator(.hidden)
            HomeTransactionCell()
              .listRowSeparator(.hidden)
            HomeTransactionCell()
              .listRowSeparator(.hidden)
            HomeTransactionCell()
              .listRowSeparator(.hidden)
            HomeTransactionCell()
              .listRowSeparator(.hidden)
            
            //            ForEach(transactions) { trx in
            ////              Text("\(trx.person) paid you \(trx.amount)")
            //            }
          }
        }
        
        //        }
        .toolbar {
          ToolbarItem {
            Button(action: {
              router.toggleProfile()
            }, label: {
              Image(systemName: "person.crop.circle.fill")
                .tint(.primary)
            })
          }
        }
        .navigationTitle("✂")
        
        FloatingButtonView()
      }
    }
  }
}

#Preview {
  HomeListView()
}
